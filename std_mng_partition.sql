CREATE OR REPLACE FUNCTION Sys_Divide_Str (
   prm_stringa                IN       VARCHAR2
  ,prm_divisore               IN       VARCHAR2
  ,prm_token                  IN       NUMBER
)
   RETURN VARCHAR2
AS
/**************************************************************************************************
   NAME           : sys_divide_str
   PURPOSE        : Estrae da una stringa una parte di essa compresa da due occorrenze del divisore.
                  Ad esempio puo servire per suddividere in campi una stringa di dati prelevata da un
               file di testo CSV utilizzando come divisore il carattere ','
   NOTE           :
   EXAMPLE USE    :
    sys_divide_str('1777109|11|22|Comp. Reg. Cent. Roma |asd_ujh-w|RR54','|',5) ritorna 'asd_ujh-w'
    sys_divide_str('token1XXtoken2XXtoken3XXtoken4','XX',3) ritorna 'token3'
    sys_divide_str('token1XXtoken2XXtoken3XXtoken4','XX',-3) ritorna 'token2'
    sys_divide_str('token1XXtoken2XXtoken3XXtoken4','XX',0) ritorna NULL
    sys_divide_str('token1XXtoken2XXtoken3XXtoken4','XX',99) ritorna NULL
    sys_divide_str('token1XXtoken2XXtoken3XXtoken4','XX',-99) ritorna NULL
    sys_divide_str('token1XXtoken2XXtoken3XXtoken4','XX',-1) ritorna 'token4'


   PARAMETERS
   prm_stringa in varchar2  : stringa da dividere
   prm_divisore in varchar2 : stringa da utilizzare come separatore tra i token (uno o piu caratteri)
   prm_token in number      : numero posizionale del token da estrarre ,il primo,il quarto ecc ...
                              se si indica zero o un valore molto alto (ovvero un token che non esiste) ritorna NULL.

   RITORNA  varchar2 : token estratto da prm_stringa oppure
                          NULL se prm_divisore e vuoto o non esiste il token richiesto in prm_stringa

   REVISIONS
   Ver        Date        Author                  Desc ription
   ---------  ----------  ----------------------  ------------------------------------------------
   1.0        04/04/2002  De Torre Giorgio        Creazione
   1.1        03/05/2002  De Torre Giorgio        added : possibilita di estrarre il token 9999
   1.2        24/02/2004  De Torre Giorgio        added : possibilita di estrarre a ritroso
   x.x        %DATE%      %username%              %description%

**************************************************************************************************/
--- variabili locali
   l_divisore_len   NUMBER;
   l_token_len      NUMBER;
   l_token          NUMBER;
   l_from           NUMBER;
   l_to             NUMBER;
   l_verso          NUMBER          := 1;
----- obbligatorie
   ret_out          NUMBER;
   -- serve a salvare l'esito della proc corrente (0 ok, >0 sqlcode errore)
   ret_out_sub      NUMBER;
   -- serve a salvare l'esito di una proc richiamata (0 ok, >0 sqlcode errore)
   l_nome_proc      VARCHAR2 (30);
   l_messaggio      VARCHAR2 (1000);
----- altre
   retcode          VARCHAR2 (1000);
BEGIN
   l_nome_proc := 'SYS_DIVIDE_STR';
              -- inserire il nome della proc IN MAIUSCOLO deve essere identica in SYS_TAB_PROCEDURE
   --- scrivo il log di inizio
-- SYS_WR_LOG (L_NOME_PROC, 'LOG', 'Inizio', 0, '');

   ------ INIZIO corpo della procedura ------
   l_divisore_len := LENGTH (prm_divisore);

   --- se il divisore e vuoto restituisco la stringa vuota
   IF l_divisore_len IS NULL OR l_divisore_len = 0
   THEN
      retcode := NULL;
      RETURN retcode;
   END IF;

   IF prm_token = 0
   THEN
      retcode := NULL;
      RETURN retcode;
   END IF;

   IF prm_token < 0
   --- sto cercando a partire dal fondo della stringa
   THEN
      l_token := prm_token * -1;

      --- gestione eccezionale del primo token
      IF l_token = 1
      THEN
         l_to := LENGTH (prm_stringa) + 1;
         l_from := INSTR (prm_stringa, prm_divisore, -1, l_token) + l_divisore_len;
      ELSE
         --- cerco la occorrenza del divisore precedente quella desiderata
         l_to := INSTR (prm_stringa, prm_divisore, -1, l_token - 1);
         --- cerco la occorrenza del divisore desiderata
         l_from := INSTR (prm_stringa, prm_divisore, -1, l_token) + l_divisore_len;
      END IF;
   ELSE
      --- sto cercando a partire dall'inizio della stringa
      l_token := prm_token;

      --- gestione eccezionale del primo token
      IF l_token = 1
      THEN
         l_from := 1;
         l_to := INSTR (prm_stringa, prm_divisore, 1, l_token);
      ELSE
         --- cerco la occorrenza del divisore precedente quella desiderata
         l_from := INSTR (prm_stringa, prm_divisore, 1, l_token - 1) + l_divisore_len;
         --- cerco la occorrenza del divisore desiderata
         l_to := INSTR (prm_stringa, prm_divisore, 1, l_token);
         --- ho trovato il token
         IF l_from = l_divisore_len
         THEN
              l_from:=0;
             l_to:=0;
         ELSE
            --- il token e l'ultimo elemento ?
            IF l_from = INSTR (prm_stringa, prm_divisore, -1, 1) + l_divisore_len
            THEN
               l_to := LENGTH (prm_stringa) + 1;
            END IF;
         END IF;
      END IF;
   END IF;

--- calcolo la lunghezza del token da estrarre
   l_token_len := l_to - l_from;
   --- estraggo il token
   retcode := SUBSTR (prm_stringa, l_from, l_token_len);
------ FINE corpo della procedura ------
-- COMMIT;
   --- scrivo il log di fine
-- SYS_WR_LOG (L_NOME_PROC, 'LOG', 'Fine', 0, '');
   RETURN retcode;
EXCEPTION
   WHEN OTHERS
   THEN
      retcode := NULL;
--    SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica', SQLCODE, SQLERRM);
      RETURN retcode;
END Sys_Divide_Str;
/


CREATE OR REPLACE FUNCTION Sys_Get_Partition
(p_owner IN VARCHAR, 
p_tab_name IN VARCHAR,
p_part_name IN VARCHAR
)
RETURN VARCHAR2
AS
/**************************************************************************************************
   NAME           : sys_get_partition 
   PURPOSE        : ritorna il nome della partizione richiesta se esiste altrimenti NULL

   NOTE           : 
   EXAMPLE USE	  :SELECT sys_get_partition('dw_com_sa','tbcedol_p','MESE_0101') part_name FROM dual

   PARAMETERS 
	p_owner IN VARCHAR 	   : nome dell'owner della tabella 
	p_tab_name IN VARCHAR  : nome della tabella (no synonim)
	p_part_name IN VARCHAR : nome partizione richiesta

   RITORNA 	varchar2	   : null in caso non esiste la partizione richiesta

   REVISIONS
   Ver        Date        Author                  Description
   ---------  ----------  ----------------------  ------------------------------------------------
   0.0        04/05/2004  De Torre Giorgio	  	  Ultima versione
   1.0        18/05/2004  De Torre Giorgio	  	  creazione
   1.1        26/05/2004  De Torre Giorgio	  	  modificato gestione errore

**************************************************************************************************/
--- variabili locali
----- obbligatorie
	l_ret_out	NUMBER;		-- serve a salvare l'esito della proc corrente (0 ok, >0 sqlcode errore)
	l_ret_out_sub	NUMBER;		-- serve a salvare l'esito di una proc richiamata (0 ok, >0 sqlcode errore)
	l_nome_proc	VARCHAR2(30);
	l_messaggio	VARCHAR2(1000);

----- altre
   	l_time_elapsed   NUMBER := NULL;
   	l_time_begin     NUMBER := NULL;
	l_numrowsel     NUMBER;
	l_numrowins     NUMBER;
	l_numrowupd     NUMBER;
	l_numrowdel     NUMBER;
   	l_step	    	VARCHAR(10);
	l_return 		VARCHAR2(1000):=NULL;
	l_part_name		VARCHAR2(30);
  
 
BEGIN

--	SYS_NEW_ELAB;				-- Attivare solo se questa e la proc principale !!!
	L_NOME_PROC := 'SYS_GET_PARTITION'; 	-- inserire il nome della proc IN MAIUSCOLO deve essere identica in SYS_TAB_FUNCTION
	--- scrivo il log di inizio
--	Sys_Wr_Log (L_NOME_PROC, 'LOG', 'Inizio', SQLCODE, SQLERRM);

------ INIZIO corpo della procedura ------
   	l_time_begin := NVL(TO_CHAR(SYSDATE,'sssss'),0);
	l_ret_out := 0;				-- inizializzo l'eventuale ritorno dell'esito della proc
	l_step:='1';				-- serve per identificare la parte dove si verifica un errore generico

	SELECT 
	t.PARTITION_NAME INTO l_return
--	,k.COLUMN_NAME
	--,K.HIGH_VALUE
	FROM ALL_TAB_PARTITIONS t
	,ALL_PART_KEY_COLUMNS k
	WHERE 
	t.TABLE_OWNER LIKE UPPER(p_OWNER)
	AND t.TABLE_NAME LIKE UPPER(p_TAB_NAME)
	AND k.NAME=t.TABLE_NAME
	AND k.owner= t.TABLE_OWNER
	AND t.PARTITION_NAME=UPPER(p_PART_NAME);
	
------ FINE corpo della procedura ------
--	COMMIT;
	l_step:='9';

	--- scrivo il log di fine
   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   	Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
--	Sys_Wr_Log (L_NOME_PROC, 'LOG', 'Fine', SQLCODE, SQLERRM);

	RETURN l_return;
--- gestione errore generale per la procedura. Qualsiasi errore viene intercettato qui.
EXCEPTION
	WHEN NO_DATA_FOUND  THEN
		l_return := NULL;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
		Sys_Wr_Log (L_NOME_PROC, 'ERR', 'La partizione <'||p_PART_NAME||'> non esiste ! (step='||l_step||')', SQLCODE, SQLERRM);
		RETURN l_return;

	WHEN OTHERS THEN
		l_return := SQLCODE;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   		Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
--		Sys_Wr_Log (L_NOME_PROC, 'ERR', 'Exception OTHERS generica (step='||l_step||')', SQLCODE, SQLERRM);
--      ROLLBACK;	-- in questo modo si ritorna alla situazione precedente l'errore
--      RAISE;		-- in questo modo si passa il sqlcode alla proc/fun chiamante
		RETURN l_return;

END Sys_Get_Partition ;
/


CREATE OR REPLACE FUNCTION Sys_Mng_Partition
(p_action IN VARCHAR,
p_owner IN VARCHAR, 
p_tab_name IN VARCHAR,
p_part_name IN VARCHAR,
p_part_split IN VARCHAR,
p_part_bound IN  VARCHAR 
)
RETURN VARCHAR2
AS
/**************************************************************************************************
   NAME           : Sys_Mng_Partition 
   PURPOSE        : esegue diverse azioni sulla partizione della tabella e ritorna ....

   NOTE           : 
   EXAMPLE USE	  :SELECT Sys_Mng_Partition('add','dw_com_sa','tbcedol_p','MESE_0101','','') part_name FROM dual

   PARAMETERS 
	p_owner IN VARCHAR 	   : nome dell'owner della tabella 
	p_tab_name IN VARCHAR  : nome della tabella (no synonim)
	p_part_name IN VARCHAR : nome partizione richiesta

   RITORNA 	varchar2	   : null in caso non esiste la partizione richiesta

   REVISIONS
   Ver        Date        Author                  Description
   ---------  ----------  ----------------------  ------------------------------------------------
   0.0        04/05/2004  De Torre Giorgio	  	  Ultima versione
   1.0        27/05/2004  De Torre Giorgio	  	  creazione

**************************************************************************************************/
--- variabili locali
----- obbligatorie
	l_ret_out	NUMBER;		-- serve a salvare l'esito della proc corrente (0 ok, >0 sqlcode errore)
	l_ret_out_sub	NUMBER;		-- serve a salvare l'esito di una proc richiamata (0 ok, >0 sqlcode errore)
	l_nome_proc	VARCHAR2(30);
	l_messaggio	VARCHAR2(1000);

----- altre
   	l_time_elapsed   NUMBER := NULL;
   	l_time_begin     NUMBER := NULL;
	l_numrowsel     NUMBER;
	l_numrowins     NUMBER;
	l_numrowupd     NUMBER;
	l_numrowdel     NUMBER;
   	l_step	    	VARCHAR(10);
	l_return 		VARCHAR2(1000):=NULL;
	l_part_name		VARCHAR2(30);
	l_ret_char		VARCHAR2(30);
	l_cmdsql 		VARCHAR2(2000):=NULL;
  
 
BEGIN

--	SYS_NEW_ELAB;				-- Attivare solo se questa e la proc principale !!!
	L_NOME_PROC := 'SYS_MNG_PARTITION'; 	-- inserire il nome della proc IN MAIUSCOLO deve essere identica in SYS_TAB_FUNCTION
	--- scrivo il log di inizio
--	Sys_Wr_Log (L_NOME_PROC, 'LOG', 'Inizio', SQLCODE, SQLERRM);

------ INIZIO corpo della procedura ------
   	l_time_begin := NVL(TO_CHAR(SYSDATE,'sssss'),0);
	l_ret_out := 0;				-- inizializzo l'eventuale ritorno dell'esito della proc
	l_numrowsel := 0;
	l_numrowins := 0;
	l_numrowupd := 0;
	l_numrowdel := 0;
	l_step:='1';				-- serve per identificare la parte dove si verifica un errore generico

	--- check valori p_action
	l_ret_out:=INSTR('ADD-SPLIT-TRUNC-GET-DROP-EXCHG',UPPER(p_action));
	--- argometo non valido o inesistente
	IF l_ret_out =0 THEN
		l_return := NULL;
		RETURN l_return;
	END IF;
	
	 CASE p_action
        WHEN 'GET' THEN    
			 l_ret_char:=Sys_Get_Partition(p_owner,p_tab_name ,p_part_name );

        WHEN 'ADD' THEN
			 NULL;    

        WHEN 'SPLIT' THEN
		--- controllo gli argomenti per questa azione
			l_ret_char:=Sys_Get_Partition(p_owner,p_tab_name ,p_part_name );
			IF l_ret_char=p_part_name THEN
				--- se NON esiste divido la partizione generica in funzione del mese di elaborazione
-- es. per date				l_cmdsql := 'ALTER TABLE '||p_owner||'.'||p_tab_name ||' SPLIT PARTITION '|| p_part_split ||'AT (TO_DATE('''||p_part_bound||' 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'')) INTO (PARTITION '||p_part_name ||' NOLOGGING, PARTITION '||p_part_split||')';
				l_cmdsql := 'ALTER TABLE :owner.:tab_name SPLIT PARTITION :part_split AT (:part_bound) INTO (PARTITION :part_name NOLOGGING, PARTITION :part_split)';
                EXECUTE IMMEDIATE l_cmdsql USING p_owner,p_tab_name,p_part_split,p_part_name;
			END IF;	

        WHEN 'TRUNC' THEN
			l_ret_char:=Sys_Get_Partition(p_owner,p_tab_name ,p_part_name );
			IF l_ret_char=p_part_name THEN
				--- se esiste la tronco...
--				Sys_Exec_Ddl('ALTER TABLE '||p_owner||'.'||p_tab_name ||' TRUNCATE PARTITION '||p_part_name ||'',l_nome_proc,l_ret_out_sub);
				l_cmdsql :='ALTER TABLE :owner.:tab_name TRUNCATE PARTITION :p_part_name';
                EXECUTE IMMEDIATE l_cmdsql USING p_owner,p_tab_name,p_part_name;
			END IF;	

        WHEN 'DROP' THEN
			 NULL;  
        
        WHEN 'EXCHG' THEN
			l_ret_char:=Sys_Get_Partition(p_owner,p_tab_name ,p_part_name );
            l_cmdsql := 'ALTER TABLE :owner.tab_name EXCHANGE PARTITION :part_name WITH TABLE :tab_name_exchg WITHOUT VALIDATION';          
            EXECUTE IMMEDIATE l_cmdsql USING p_owner,p_tab_name,p_part_name,p_tab_name_exchg;

        ELSE
     		NULL;
     END CASE;

------ FINE corpo della procedura ------
--	COMMIT;
	l_step:='9';

	--- scrivo il log di fine
   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   	Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
--	Sys_Wr_Log (L_NOME_PROC, 'LOG', 'Fine', SQLCODE, SQLERRM);

	RETURN l_return;
--- gestione errore generale per la procedura. Qualsiasi errore viene intercettato qui.
EXCEPTION
	WHEN NO_DATA_FOUND  THEN
		l_return := NULL;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
		Sys_Wr_Log (L_NOME_PROC, 'ERR', 'La partizione <'||p_PART_NAME||'> non esiste ! (step='||l_step||')', SQLCODE, SQLERRM);
		RETURN l_return;

	WHEN OTHERS THEN
		l_return := SQLCODE;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   		Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
		Sys_Wr_Log (L_NOME_PROC, 'ERR', 'Exception OTHERS generica (step='||l_step||')', SQLCODE, SQLERRM);
--      ROLLBACK;	-- in questo modo si ritorna alla situazione precedente l'errore
--      RAISE;		-- in questo modo si passa il sqlcode alla proc/fun chiamante
		RETURN l_return;

END Sys_Mng_Partition ;
/
