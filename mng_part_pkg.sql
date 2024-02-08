
CREATE TABLE T_SYS_TAB_LOG
(
  PROGRESSIVO  VARCHAR2(20 BYTE),
  DT_ELAB      DATE,
  COD_PROC     VARCHAR2(5 BYTE),
  TIPO_MSG     VARCHAR2(3 BYTE),
  MESSAGGIO    VARCHAR2(1000 BYTE),
  SQL_CODE     NUMBER,
  SQL_ERRM     VARCHAR2(1000 BYTE)
)
TABLESPACE &TBS_NAME
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE T_SYS_TAB_LOG IS 'Tabella di log';

COMMENT ON COLUMN T_SYS_TAB_LOG.PROGRESSIVO IS 'Progressivo messaggio (numelab-nummsg)';

COMMENT ON COLUMN T_SYS_TAB_LOG.DT_ELAB IS 'Data ora del messaggio';

COMMENT ON COLUMN T_SYS_TAB_LOG.COD_PROC IS 'Codice procedura';

COMMENT ON COLUMN T_SYS_TAB_LOG.TIPO_MSG IS 'Tipo messaggio utente';

COMMENT ON COLUMN T_SYS_TAB_LOG.MESSAGGIO IS 'Testo messaggio utente';

COMMENT ON COLUMN T_SYS_TAB_LOG.SQL_CODE IS 'Codice errore ORACLE';

COMMENT ON COLUMN T_SYS_TAB_LOG.SQL_ERRM IS 'Testo errore ORACLE';


CREATE PUBLIC SYNONYM T_SYS_TAB_LOG FOR T_SYS_TAB_LOG;


GRANT DELETE, INSERT, SELECT, UPDATE ON  T_SYS_TAB_LOG TO ABACUS_UNITST_CREATOR;

CREATE TABLE T_SYS_TAB_PROCEDURE
(
  CODICE_PROCEDURA     VARCHAR2(5 BYTE),
  NOME_PROCEDURA       VARCHAR2(50 BYTE),
  DESCRIZIONE          VARCHAR2(1000 BYTE),
  DATA_RILASCIO        DATE,
  AUTORE               VARCHAR2(50 BYTE),
  ULTIMA_ELABORAZIONE  NUMBER(38),
  CURR_ELAB            NUMBER(38)
)
TABLESPACE &TBS_NAME
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE T_SYS_TAB_PROCEDURE IS 'Tabella delle proc/funz abilitate a tracciare il log';

COMMENT ON COLUMN T_SYS_TAB_PROCEDURE.CODICE_PROCEDURA IS 'Codice procedura';

COMMENT ON COLUMN T_SYS_TAB_PROCEDURE.NOME_PROCEDURA IS 'Nome procedura';

COMMENT ON COLUMN T_SYS_TAB_PROCEDURE.DESCRIZIONE IS 'Descrizione';

COMMENT ON COLUMN T_SYS_TAB_PROCEDURE.DATA_RILASCIO IS 'Data di rilascio';

COMMENT ON COLUMN T_SYS_TAB_PROCEDURE.AUTORE IS 'Autore';

COMMENT ON COLUMN T_SYS_TAB_PROCEDURE.ULTIMA_ELABORAZIONE IS 'Quantità di elaborazioni esguite';

COMMENT ON COLUMN T_SYS_TAB_PROCEDURE.CURR_ELAB IS 'Elaborazione corrente';


CREATE PUBLIC SYNONYM T_SYS_TAB_PROCEDURE FOR T_SYS_TAB_PROCEDURE;


GRANT DELETE, INSERT, SELECT, UPDATE ON  T_SYS_TAB_PROCEDURE TO ABACUS_UNITST_CREATOR;

Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('00900', 'DUAL', 'PROCEDURE : DUAL', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('00901', 'X_TEST1', 'PROCEDURE : X_TEST1', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('00902', 'X_TEST', 'PROCEDURE : X_TEST', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('01000', 'P_SYS_WR_LOG', 'PROCEDURE : P_SYS_TAB_LOG - scrive un messaggio di log sulla tabella T_SYS_TAB_LOG', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('01002', 'P_SYS_EXEC_DDL', 'PROCEDURE : P_SYS_EXEC_DDL - esegue SQL dinamico e traccia su T_SYS_TAB_LOG il risultato dell''esecuzione', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('01006', 'P_MNG_PARTITION', 'PROCEDURE : P_MNG_PARTITION - gestione tabelle partizionate', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('01008', 'P_TRUNCATE_TABLE', 'PROCEDURE : P_TRUNCATE_TABLE', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('00903', 'HOST', 'SCRIPT : HOST', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('01001', 'P_SYS_NEW_ELAB', 'PROCEDURE : P_SYS_NEW_ELAB - ricava un nuovo numero sequenziale della elaborazione da usare nel progressivo della tabella di LOG', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('01003', 'P_GATHER_STAT', 'PROCEDURE : P_GATHER_STAT - esegue l analisi della tabella indicata come parametro', sysdate, '<Sistema>', 0, 0);
Insert into T_SYS_TAB_PROCEDURE
   (CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO, AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB)
 Values
   ('01011', 'P_SYS_EXEC_DDL_OWNER', 'PROCEDURE : P_SYS_EXEC_DDL_OWNER - esegue DDL su oggetti dello stesso owner', sysdate, '<Sistema>', 0, 0);
COMMIT;



DROP SEQUENCE S_SYS_NUM_SEQ;

CREATE SEQUENCE S_SYS_NUM_SEQ
  START WITH 1
  MAXVALUE 99999
  MINVALUE 1
  CYCLE
  NOCACHE
  NOORDER
  
  
  DROP SEQUENCE S_SYS_NUM_ELAB;

CREATE SEQUENCE S_SYS_NUM_ELAB
  START WITH 1
  MAXVALUE 99999
  MINVALUE 1
  CYCLE
  NOCACHE
  NOORDER;




CREATE OR REPLACE FUNCTION "F_EXIST_PARTITION"("P_TYPE_OBJ" IN VARCHAR2,  "P_OWNER_OBJ" IN VARCHAR2,  "P_NAME_OBJ" IN VARCHAR2,  "P_NAME_PART" IN VARCHAR2) RETURN VARCHAR2    IS 
/**************************************************************************************************
   NAME           : f_exist_partition 
   PURPOSE        : controlla se esiste la partizione richiesta 

   NOTE           :  
   EXAMPLE USE	  :

   PARAMETERS 
    p_type_obj in varchar2  tipo di oggetto (TAB/IND) 
    p_owner_obj in varchar2  owner dell'oggetto 
    p_name_obj in varchar2  nome dell'oggetto 
    p_name_part in varchar2  nome della partizione 

   RITORNA 	varchar2
            nome della partizione    
            SQLCODE errore o NULL

   REVISIONS
   Ver        Date			Author					Description
   ---------  ----------	----------------------	------------------------------------------------
   0.0        12/10/2007	De Torre Giorgio		Ultima versione
   1.0        04/10/2007			%description%

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
   	l_step	    	VARCHAR(10);
	l_return 	    varchar2(100);
    l_type_obj      varchar2(3);
    l_partname      varchar2(100);
    l_subpartname   varchar2(100);
    l_part_type     varchar2(20);

    K_PART_NORM VARCHAR(10):='NORMAL';
    K_PART_PART VARCHAR(10):='PART';
    K_PART_SUB VARCHAR(10):='SUBPART';

BEGIN
--	SYS_NEW_ELAB;				-- Attivare solo se questa è la proc principale !!!
	L_NOME_PROC := 'F_EXIST_PARTITION'; 	-- inserire il nome della proc IN MAIUSCOLO deve essere identica in SYS_TAB_FUNCTION
	--- scrivo il log di inizio
--	P_SYS_WR_LOG_START (L_NOME_PROC,l_ret_out_sub);

------ INIZIO corpo della procedura ------
   	l_time_begin := NVL(TO_CHAR(SYSDATE,'sssss'),0);
	l_ret_out := 0;				-- inizializzo l'eventuale ritorno dell'esito della proc
	l_step:='1';				-- serve per identificare la parte dove si verifica un errore generico

    l_type_obj:=upper(p_type_obj);
--    l_part_type:=trim(upper(p_part_type));
    
    if l_type_obj <> 'TAB' and l_type_obj <> 'IND' then
    	P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Parametro <tipo oggetto> errato', 0,null);
        return null;
    end if;

	l_step:='2';
    if l_part_type <>K_PART_PART  and l_part_type <>K_PART_SUB then
	l_step:='2.1';
    	P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Parametro <tipo partizione> errato', 0,null);
        return null;
    end if;


    case 
        when l_type_obj = 'TAB' then
        BEGIN
            
        	l_step:='3';

            SELECT  
            PARTITION_NAME into l_partname
            from (SELECT  
                p.PARTITION_NAME PARTITION_NAME 
                FROM  
                ALL_TAB_PARTITIONS p
                WHERE p.table_owner = UPPER(p_owner_obj)
                and p.TABLE_NAME = p_name_obj
                and p.PARTITION_NAME = p_name_part
                union
                SELECT  
                sp.SUBPARTITION_NAME
                FROM  
                ALL_TAB_SUBPARTITIONS sp
                WHERE sp.table_owner = UPPER(p_owner_obj)
                and sp.TABLE_NAME = p_name_obj
                and sp.SUBPARTITION_NAME = p_name_part);

        EXCEPTION
        	WHEN NO_DATA_FOUND THEN
            l_return:=-1;
            l_partname:=null;
        END;
           

        when l_type_obj = 'IND' then
        BEGIN
	        l_step:='4';
            
            SELECT  
            PARTITION_NAME into l_partname
            from (SELECT  
                p.PARTITION_NAME PARTITION_NAME 
                FROM  
                ALL_IND_PARTITIONS p
                WHERE p.index_owner = UPPER(p_owner_obj)
                and p.INDEX_NAME = p_name_obj
                and p.PARTITION_NAME = p_name_part
                union
                SELECT  
                sp.SUBPARTITION_NAME
                FROM  
                ALL_IND_SUBPARTITIONS sp
                WHERE sp.index_owner = UPPER(p_owner_obj)
                and sp.INDEX_NAME = p_name_obj
                and sp.SUBPARTITION_NAME = p_name_part);

        EXCEPTION
        	WHEN NO_DATA_FOUND  THEN
            l_return:=-2;
            l_partname:=null;
        END;
        l_return:=case when l_part_type=K_PART_PART then l_partname when l_part_type=K_PART_SUB then l_subpartname end;

    end case; 


    l_return:=l_partname;
            
------ FINE corpo della procedura ------
	l_step:='99';

	--- scrivo il log di fine
   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   	P_Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
--	P_SYS_WR_LOG_END (L_NOME_PROC, l_ret_out_sub);

	return l_return;
--- gestione errore generale per la procedura. Qualsiasi errore viene intercettato qui.
EXCEPTION
	WHEN OTHERS THEN
		l_return := SQLCODE;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   		P_Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
		P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica (step='||l_step||')', SQLCODE, SQLERRM);
--      ROLLBACK;	-- in questo modo si ritorna alla situazione precedente l'errore
--      RAISE;		-- in questo modo si passa il sqlcode alla proc/fun chiamante
		return l_return;

END f_exist_partition ;
/

CREATE OR REPLACE FUNCTION "F_GET_PARTITION"("P_TYPE_OBJ" IN VARCHAR2,  "P_OWNER_OBJ" IN VARCHAR2,  "P_NAME_OBJ" IN VARCHAR2,  "P_NAME_PART" IN VARCHAR2,  "P_PART_TYPE" IN VARCHAR2) RETURN VARCHAR2    IS 
/**************************************************************************************************
   NAME           : f_get_partition 
   PURPOSE        : reperisce la lista delle partizione della tabella indicata 

   NOTE           :  DA FINIRE !!!
   
     
   EXAMPLE USE	  :

   PARAMETERS 
    p_type_obj in varchar2  tipo di oggetto (TAB/IND) 
    p_owner_obj in varchar2  owner dell'oggetto 
    p_name_obj in varchar2  nome dell'oggetto 
    p_name_part in varchar2  nome della partizione 

   RITORNA 	varchar2
            refcursor con elenco partizioni e/o subpart     
            SQLCODE errore o NULL

   REVISIONS
   Ver        Date			Author					Description
   ---------  ----------	----------------------	------------------------------------------------
   0.0        12/10/2007	De Torre Giorgio		Ultima versione
   1.0        04/10/2007			%description%

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
   	l_step	    	VARCHAR(10);
	l_return 	    varchar2(100);
    l_type_obj      varchar2(3);
    l_partname      varchar2(100);
    l_subpartname   varchar2(100);
    l_part_type     varchar2(20);

    K_PART_NORM VARCHAR(10):='NORMAL';
    K_PART_PART VARCHAR(10):='PART';
    K_PART_SUB VARCHAR(10):='SUBPART';

BEGIN
--	SYS_NEW_ELAB;				-- Attivare solo se questa è la proc principale !!!
	L_NOME_PROC := 'F_GET_PARTITION'; 	-- inserire il nome della proc IN MAIUSCOLO deve essere identica in SYS_TAB_FUNCTION
	--- scrivo il log di inizio
--	P_SYS_WR_LOG_START (L_NOME_PROC,l_ret_out_sub);

------ INIZIO corpo della procedura ------
   	l_time_begin := NVL(TO_CHAR(SYSDATE,'sssss'),0);
	l_ret_out := 0;				-- inizializzo l'eventuale ritorno dell'esito della proc
	l_step:='1';				-- serve per identificare la parte dove si verifica un errore generico

    l_type_obj:=upper(p_type_obj);
    l_part_type:=trim(upper(p_part_type));
    
    if l_type_obj <> 'TAB' and l_type_obj <> 'IND' then
    	P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Parametro <tipo oggetto> errato', 0,null);
        return null;
    end if;

	l_step:='2';
    if l_part_type <> K_PART_PART and l_part_type <> K_PART_SUB then
	l_step:='2.1';
    	P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Parametro <tipo partizione> errato', 0,null);
        return null;
    end if;


    case 
        when l_type_obj = 'TAB' then
        BEGIN
            
            case 
                when l_part_type=K_PART_PART then
        	        l_step:='3';
                    SELECT  
                    p.PARTITION_NAME into l_partname
                    FROM  
                    ALL_TAB_PARTITIONS p
                    WHERE p.table_owner = UPPER(p_owner_obj)
                    and p.TABLE_NAME = p_name_obj
                    and p.PARTITION_NAME = p_name_part;

                when l_part_type=K_PART_SUB then
                	l_step:='31';
                    SELECT  
                    sp.SUBPARTITION_NAME into l_subpartname
                    FROM  
                    ALL_TAB_SUBPARTITIONS sp
                    WHERE sp.table_owner = UPPER(p_owner_obj)
                    and sp.TABLE_NAME = p_name_obj
                    and sp.SUBPARTITION_NAME = p_name_part;
            end case; 


        EXCEPTION
        	WHEN NO_DATA_FOUND THEN
            l_return:=-1;
            l_partname:='NA';
            l_subpartname:='NA';
        END;
           

        when l_type_obj = 'IND' then
        BEGIN
	        l_step:='4';
            
            SELECT  
            p.PARTITION_NAME, --p.PARTITION_POSITION,
            sp.SUBPARTITION_NAME -- , sp.SUBPARTITION_POSITION
            into l_partname, l_subpartname
            FROM  
            ALL_INDEXES t
            ,ALL_IND_PARTITIONS p
            ,ALL_IND_SUBPARTITIONS sp
            WHERE t.owner = UPPER(p_owner_obj)
            and decode(l_part_type,K_PART_PART,p.PARTITION_NAME, sp.SUBPARTITION_NAME ) = p_name_part    
            and t.INDEX_NAME = p_name_obj
            and t.INDEX_NAME = p.INDEX_NAME(+)
            and t.OWNER = p.INDEX_OWNER(+)
            and t.INDEX_NAME=sp.INDEX_NAME(+)
            and t.OWNER = sp.INDEX_OWNER(+)
            and rownum=1;

        EXCEPTION
        	WHEN NO_DATA_FOUND  THEN
            l_return:=-2;
            l_partname:='NA';
            l_subpartname:='NA';
        END;
        l_return:=case when l_part_type=K_PART_PART then l_partname when l_part_type=K_PART_SUB then l_subpartname end;

    end case; 
            
        
    case 
    when l_part_type=K_PART_PART then 
        l_return:=l_partname ;
        
    when l_part_type=K_PART_SUB then 
        l_return:=l_subpartname; 
    end case;    
            
------ FINE corpo della procedura ------
	l_step:='99';

	--- scrivo il log di fine
   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   	P_Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
--	P_SYS_WR_LOG_END (L_NOME_PROC, l_ret_out_sub);

	return l_return;
--- gestione errore generale per la procedura. Qualsiasi errore viene intercettato qui.
EXCEPTION
	WHEN OTHERS THEN
		l_return := SQLCODE;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   		P_Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
		P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica (step='||l_step||')', SQLCODE, SQLERRM);
--      ROLLBACK;	-- in questo modo si ritorna alla situazione precedente l'errore
--      RAISE;		-- in questo modo si passa il sqlcode alla proc/fun chiamante
		return l_return;
END f_get_partition ;
/

CREATE OR REPLACE FUNCTION "F_MNG_PARTITION"(
"P_ACTION" IN VARCHAR2,  
"P_OWNER" IN VARCHAR2,  
"P_TAB_NAME" IN VARCHAR2,  
"P_PART_NAME" IN VARCHAR2,  
"P_PART_SPLIT" IN VARCHAR2,  
"P_PART_BOUND" IN VARCHAR2,  
"P_TAB_NAME_EXCHG" IN VARCHAR2,  
"P_RET_OUT" OUT NOCOPY VARCHAR2) RETURN VARCHAR2    IS 
/**************************************************************************************************
   NAME           : P_Mng_Partition 
   PURPOSE        : esegue diverse azioni sulla partizione della tabella e ritorna ....

   NOTE           : lo user che esegue il comando sulla tab deve avere i seguanti grants
        ALTER 

   
   EXAMPLE USE	  :SELECT P_Mng_Partition('add','dw_com_sa','tbcedol_p','MESE_0101','','') part_name FROM dual

   PARAMETERS 
	p_owner          IN VARCHAR : nome dell'owner della tabella 
	p_tab_name       IN VARCHAR : nome della tabella (no synonym) 
	p_part_name      IN VARCHAR : nome partizione richiesta
    p_part_split     IN VARCHAR : nome partizione da splittare
    p_part_bound     IN VARCHAR : limite della range partition per fare split  
    p_tab_name_exchg IN VARCHAR : nome tab da scambiare con la tab_name

   RITORNA 	varchar2	   
        0 in caso l'azione è stata eseguita
        sqlcode in caso di errore

   REVISIONS
   Ver        Date        Author                  Description
   ---------  ----------  ----------------------  ------------------------------------------------
   0.0        04/05/2004  De Torre Giorgio	  	  Ultima versione
   1.0        27/05/2004  De Torre Giorgio	  	  creazione
   1.1        03/10/2008  De Torre Giorgio	  	  implementato EXCHANGE partition

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
   	l_step	    	VARCHAR(10);
	l_return 		VARCHAR2(1000):=NULL;
	l_part_name		VARCHAR2(80);
	l_ret_char		VARCHAR2(80);
	l_cmdsql 		VARCHAR2(2000):=NULL;
    l_type_part     varchar2(20);
    l_partition     varchar2(20);

    K_PART_NORM VARCHAR(10):='NORMAL';
    K_PART_PART VARCHAR(10):='PART';
    K_PART_SUB VARCHAR(10):='SUBPART';

    UDE_BAD_TABLE EXCEPTION;  
    PRAGMA EXCEPTION_INIT(UDE_BAD_TABLE, -903);

    UDE_OBJ_UNPART EXCEPTION;  
    PRAGMA EXCEPTION_INIT(UDE_OBJ_UNPART, -22001);

    UDE_ERR_PART EXCEPTION;  
    PRAGMA EXCEPTION_INIT(UDE_ERR_PART, -22002);

    UDE_ARG_INVALID EXCEPTION;  
    PRAGMA EXCEPTION_INIT(UDE_ARG_INVALID, -22003);

 
BEGIN

--	P_NEW_ELAB;				-- Attivare solo se questa e la proc principale !!!
	L_NOME_PROC := 'P_MNG_PARTITION'; 	-- inserire il nome della proc IN MAIUSCOLO deve essere identica in P_TAB_FUNCTION
	--- scrivo il log di inizio
    P_SYS_WR_LOG_START(L_NOME_PROC);

------ INIZIO corpo della procedura ------
   	l_time_begin := NVL(TO_CHAR(SYSDATE,'sssss'),0);
	l_ret_out := 0;				-- inizializzo l'eventuale ritorno dell'esito della proc

	P_SYS_WR_LOG (L_NOME_PROC, 'LOG', 'Parametri :'||'(1='||p_action||') (2='||p_owner ||') (3='||p_tab_name||') (4='||p_part_name||') (5='||p_part_split||') (6='||p_part_bound ||') (7='||p_tab_name_exchg||')', SQLCODE, SQLERRM);

	--- check valori p_action
	l_step:='1';				-- serve per identificare la parte dove si verifica un errore generico
	l_ret_out:=INSTR('ADD-SPLIT-TRUNC-GET-DROP-EXCHG-MERGE-REN',UPPER(p_action));
	--- argomento non valido o inesistente
	IF l_ret_out =0 THEN
        p_ret_out:='Argomento non valido (Action=ADD-SPLIT-TRUNC-GET-DROP-EXCHG-MERGE)';
        raise UDE_ARG_INVALID;
	END IF;

	--- check se la tab/ind è partizionata
    l_step:='2';
    l_type_part:=F_is_partitioned('TAB', p_owner, p_tab_name);
    if upper(l_type_part)=K_PART_NORM or l_type_part is null THEN
        raise UDE_OBJ_UNPART;
    else
        l_partition:=case when l_type_part=K_PART_PART then 'PARTITION' else 'SUBPARTITION' end;

        l_ret_char:=F_exist_Partition('TAB',p_owner, p_tab_name, p_part_name);
        if l_ret_char is null then
            raise UDE_ERR_PART;
        end if;
        p_ret_out:=null;
    end if;

	
    CASE p_action
        WHEN 'GET' THEN    
	        l_step:='3'; 
            l_return:=l_ret_char;           
            NULL;
            
        WHEN 'ADD' THEN
	        l_step:='4';
--            l_cmdsql:='ALTER TABLE '||p_owner||'.'||p_tab_name ||' ADD '||l_partition||' '|| p_part_name||' NEW VALUES ('''||p_val||''')'
--            P_Exec_Ddl(l_cmdsql ,l_nome_proc,l_ret_out_sub);
		    NULL;    

        WHEN 'DROP' THEN
	        l_step:='5';
--            l_cmdsql := 'ALTER TABLE '||p_owner||'.'||p_tab_name ||' MODIFY '||l_partition||' '|| p_part_name||' DROP VALUES ('''||p_val||''')';
--            P_Exec_Ddl(l_cmdsql ,l_nome_proc,l_ret_out_sub);
            NULL;  
        
        WHEN 'SPLIT' THEN       
	        l_step:='6';
            --- solo per range partitioned tables !!
            
		    --- controllo gli argomenti per questa azione
			IF l_ret_char=p_part_name THEN
				--- se NON esiste divido la partizione generica in funzione del mese di elaborazione
-- es. per date				l_cmdsql := 'ALTER TABLE '||p_owner||'.'||p_tab_name ||' SPLIT PARTITION '|| p_part_split ||'AT (TO_DATE('''||p_part_bound||' 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'')) INTO (PARTITION '||p_part_name ||' NOLOGGING, PARTITION '||p_part_split||')';
--				l_cmdsql := 'ALTER TABLE :owner.:tab_name SPLIT PARTITION :part_split AT (:part_bound) INTO (PARTITION :part_name NOLOGGING, PARTITION :part_split)';
--                EXECUTE IMMEDIATE l_cmdsql USING p_owner,p_tab_name,p_part_split,p_part_name;
                l_cmdsql := 'ALTER TABLE '||p_owner||'.'||p_tab_name ||' SPLIT '||l_partition||' '|| p_part_split ||'AT ('||p_part_bound||') INTO (PARTITION '||p_part_name ||', PARTITION '||p_part_split||')';
                P_SYS_Exec_Ddl(l_cmdsql ,l_nome_proc,l_ret_out_sub,p_owner);
                l_return := l_ret_out_sub;
			END IF;	

        WHEN 'TRUNC' THEN
	        l_step:='7';
			IF l_ret_char=p_part_name THEN
				--- se esiste quella richiesta, la tronco...
                l_cmdsql := 'ALTER TABLE '||p_owner||'.'||p_tab_name ||' TRUNCATE '||l_partition||' '|| p_part_name||' UPDATE INDEXES';
                P_SYS_Exec_Ddl(l_cmdsql ,l_nome_proc,l_ret_out_sub,p_owner);
--                l_cmdsql := 'ALTER INDEX PK_T_ANAGRAFE REBUILD PARTITION T_ANAGRAFE_PART_D TABLESPACE TS_ABACUS_UNITST_INDEX';


--  NON FUNGE !! ORA-00903: invalid table name ..anche se metto l'owner davanti !
--				l_cmdsql :='ALTER TABLE :owner.:tab_name TRUNCATE PARTITION :part_name';
--                EXECUTE IMMEDIATE l_cmdsql USING p_owner,p_tab_name,p_part_name;
                l_return := l_ret_out_sub;
			END IF;	

        WHEN 'EXCHG' THEN
	        l_step:='8';
		    --- controllo gli argomenti per questa azione
            if p_tab_name_exchg is null then 
                p_ret_out:='Argomento non valido (Nome tabella di exchange mancante)';  
                raise UDE_ARG_INVALID;
        	END IF;

--  NON FUNGE !! ORA-00903: invalid table name ..anche se metto l'owner davanti !
--            l_cmdsql := 'ALTER TABLE :tab_name EXCHANGE PARTITION :part_name WITH TABLE :tab_name_exchg WITHOUT VALIDATION';
--            EXECUTE IMMEDIATE l_cmdsql USING p_tab_name,p_part_name,p_tab_name_exchg;

            l_cmdsql := 'ALTER TABLE '||p_owner||'.'||p_tab_name||' EXCHANGE '||l_partition||' '||p_part_name ||' WITH TABLE '||p_owner||'.'||p_tab_name_exchg||' INCLUDING INDEXES WITHOUT VALIDATION';          
            P_SYS_Exec_Ddl(l_cmdsql ,l_nome_proc,l_ret_out_sub,p_owner);
            l_return := l_ret_out_sub;

        WHEN 'MERGE' THEN
	        l_step:='9';
            --- solo con subpartitions !!
		    NULL;    

        WHEN 'REN' THEN
	        l_step:='10';
--            l_cmdsql := 'ALTER TABLE '||p_owner||'.'||p_tab_name||' RENAME '||l_partition||' '||p_part_name ||' TO '||p_part_rename;          
--            P_Exec_Ddl(l_cmdsql ,l_nome_proc,l_ret_out_sub);
--            l_return := l_ret_out_sub;
--- solo con subpartitions !!
		    NULL;    

        ELSE
     		NULL;
    END CASE;

------ FINE corpo della procedura ------
--	COMMIT;
	l_step:='99';

	--- scrivo il log di fine
   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--  P_SYS_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
    P_SYS_WR_LOG_END(L_NOME_PROC);

	RETURN l_return;
--- gestione errore generale per la procedura. Qualsiasi errore viene intercettato qui.
EXCEPTION
/*	WHEN UDE_BAD_TABLE  THEN
        p_ret_out:='Tabella di exchange inesistente';  
		l_return := SQLCODE;
        RETURN l_return;
*/
	WHEN UDE_ARG_INVALID THEN
		l_return := -22003;
		P_SYS_WR_LOG (L_NOME_PROC, 'ERR', p_ret_out||' (step='||l_step||')', l_return , p_ret_out);
		RETURN -1;  ---- ATTENZIONE serve per tornare il codice da testare ! 

	WHEN UDE_OBJ_UNPART  THEN
        p_ret_out:='Oggetto non partizionato o inesistente';
		l_return := -22001;
		P_SYS_WR_LOG (L_NOME_PROC, 'ERR', p_ret_out||' (step='||l_step||')', l_return, p_ret_out);
		RETURN l_return;

	WHEN UDE_ERR_PART  THEN
        p_ret_out:='Errore get partizione';
		P_SYS_WR_LOG (L_NOME_PROC, 'ERR', p_ret_out||' (step='||l_step||')', l_return, p_ret_out);
        l_return := -22002;
		RETURN l_return;

/*	WHEN NO_DATA_FOUND  THEN
		l_return := NULL;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
		--P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'La partizione <'||p_PART_NAME||'> non esiste ! (step='||l_step||')', SQLCODE, SQLERRM);
		RETURN l_return;
*/
	WHEN OTHERS THEN
		l_return := SQLCODE;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
		P_SYS_WR_LOG (L_NOME_PROC, 'LOG', 'cmd='||l_cmdsql, SQLCODE, SQLERRM);
        
--   		P_SYS_WR_LOG (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
		P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica (step='||l_step||')', SQLCODE, SQLERRM);
--      ROLLBACK;	-- in questo modo si ritorna alla situazione precedente l'errore
--      RAISE;		-- in questo modo si passa il sqlcode alla proc/fun chiamante
		RETURN l_return;

END F_Mng_Partition ;
/

CREATE OR REPLACE PROCEDURE "P_SYS_WR_LOG"("P_NOME_PROC" IN VARCHAR2,  "P_TIPO_MSG" IN VARCHAR2,  "P_MESSAGGIO" IN VARCHAR2,  "P_SQL_CODE" IN NUMBER,  "P_SQL_ERRM" IN VARCHAR2)    IS 
PRAGMA AUTONOMOUS_TRANSACTION;
/**************************************************************************************************
   NAME         : P_SYS_WR_LOG
   PURPOSE    : scrive un messaggio di log sulla tabella SYS_TAB_LOG

   NOTE        :
   EXAMPLE USE    :  P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'called from '||L_CALL_PROC||' - '||CMD_SQL, SQLCODE, SQLERRM);

   PARAMETERS
   p_nome_proc varchar2     : nome della procedura che scrive il messaggio
   p_tipo_msg varchar2     : tipo di gravità del messaggio (LOG, ERR, WAR o quello che si vuole)
   p_messaggio varchar2     : messaggio
   p_sql_code number     : cod. di errore Oracle
   p_sql_errm varchar2     : messaggio di errore Oracle

   Per creare le sequences corrette:
    DROP SEQUENCE SYS_NUM_SEQ;
    CREATE SEQUENCE SYS_NUM_SEQ INCREMENT BY 1 START WITH 1 CYCLE NOCACHE NOORDER MAXVALUE 99999;

    DROP SEQUENCE SYS_NUM_ELAB;
    CREATE SEQUENCE SYS_NUM_ELAB INCREMENT BY 1 START WITH 1 CYCLE NOCACHE NOORDER MAXVALUE 99999;


   REVISIONS
   Ver        Date        Author                  Description
   ---------  ----------  ----------------------  ------------------------------------------------
   1.0        15/01/2001  De Torre Giorgio      Creazione procedura
   1.1          05/06/2001  De Torre Giorgio       modificato nome tab e procedure legate
   1.2          24/01/2002  De Torre Giorgio      modifiche per standard e commenti
   1.3          24/02/2004  De Torre Giorgio      aggiunto PRAGMA AUTONOMOUS_TRANSACTION
   x.x        %DATE%  %username%      %description%

**************************************************************************************************/
--- variabili locali
----- obbligatorie
    ret_out		NUMBER;		-- serve a salvare l'esito della proc corrente (0 ok, >0 sqlcode errore)
	ret_out_sub	NUMBER;		-- serve a salvare l'esito di una proc richiamata (0 ok, >0 sqlcode errore)
	l_nome_proc	VARCHAR2(30);
	l_messaggio	VARCHAR2(1000);

----- altre
	L_COD_PROC 	VARCHAR2(5);
	L_COD_PROC_PAR	VARCHAR2(5);
	L_NUM 		NUMBER;
	L_TIPO_MSG	VARCHAR2(10);
	L_SQL_CODE	NUMBER;
	L_SQL_ERRM	VARCHAR2(3000);
    l_lastcod   number;

BEGIN
	L_NOME_PROC :='P_SYS_WR_LOG';

--dbms_output.enable(1000000);
------ INIZIO corpo della procedura ------

	--- Il blocco <A> <A/> sarà sostituito da un altro parametro o variabile globale
	--- <A>
	--- se la sequenza non è inizializzata bisogna fare la seguente istruzione
	--- altrimenti -> ORA-08002: la sequenza sys_num_elab.CURRVAL non è ancora definita in questa sessione
	BEGIN
		 SELECT S_sys_num_elab.currval INTO L_NUM FROM dual;
	EXCEPTION
		WHEN OTHERS THEN
			SELECT S_sys_num_elab.nextval INTO L_NUM FROM dual;
	END;
	--- <A/>

	--- recupero il codice procedura partendo dal nome passato come parametro
	BEGIN
		SELECT CODICE_PROCEDURA
		INTO L_COD_PROC_PAR
		FROM T_SYS_TAB_PROCEDURE
		WHERE  UPPER(NOME_PROCEDURA) = upper(P_NOME_PROC);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			L_SQL_CODE:=SQLCODE;
			L_SQL_ERRM:=SQLERRM;

			--- se non trovo nulla recupero il codice procedura di SYS_WR_LOG
			SELECT CODICE_PROCEDURA
			INTO L_COD_PROC
			FROM T_SYS_TAB_PROCEDURE
			WHERE  (NOME_PROCEDURA = L_NOME_PROC);

			INSERT INTO T_SYS_TAB_LOG
			(PROGRESSIVO, DT_ELAB,
			COD_PROC, TIPO_MSG, MESSAGGIO, SQL_CODE, SQL_ERRM)
			VALUES
			(LTRIM(TO_CHAR(L_NUM,'00009'))||'-'||LTRIM(TO_CHAR(s_sys_num_seq.NEXTVAL,'00009')), SYSDATE,
			L_COD_PROC, 'ERR', upper(P_NOME_PROC)||' NON TROVATA IN TABELLA PROCEDURE!', L_SQL_CODE, L_SQL_ERRM);

            --- poi inserisco il nuovo record in automatico...
            select max(t.CODICE_PROCEDURA)+1  into l_lastcod from T_SYS_TAB_PROCEDURE t;
            
            INSERT INTO T_SYS_TAB_PROCEDURE 
            ( CODICE_PROCEDURA, NOME_PROCEDURA, DESCRIZIONE, DATA_RILASCIO,AUTORE, ULTIMA_ELABORAZIONE, CURR_ELAB ) 
            VALUES 
            ((LTRIM(TO_CHAR(l_lastcod,'00009'))), upper(P_NOME_PROC), '<aggiungere descrizione breve>',  trunc(sysdate) , '<Sistema>', 1, 0); 

	END;

	--- impostazione valori di default
	IF P_TIPO_MSG='' THEN
	   L_TIPO_MSG:='<Default>';
	ELSE
	   L_TIPO_MSG:=P_TIPO_MSG;
	END IF;
	IF P_MESSAGGIO='' THEN
	   L_MESSAGGIO:='<Default>';
	ELSE
	   L_MESSAGGIO:=P_MESSAGGIO;
	END IF;
	IF P_SQL_CODE='' THEN
	   L_SQL_CODE:=0;
	ELSE
	   L_SQL_CODE:=P_SQL_CODE;
	END IF;
	IF P_SQL_ERRM='' THEN
	   L_SQL_ERRM:='<Default>';
	ELSE
	   L_SQL_ERRM:=P_SQL_ERRM;
	END IF;


--    l_messaggio	:=SYSDATE||'-'|| p_nome_proc ||'-'||L_TIPO_MSG||'-'|| L_messaggio||'-'|| L_SQL_CODE||'-'|| L_SQL_ERRM;
--    DBMS_OUTPUT.Put_Line(l_messaggio);

	--- inserisco il messaggio di log nella tabella
	INSERT INTO T_SYS_TAB_LOG
	(PROGRESSIVO, DT_ELAB,
	COD_PROC, TIPO_MSG, MESSAGGIO, SQL_CODE, SQL_ERRM)
	VALUES
	(LTRIM(TO_CHAR(L_NUM,'00009'))||'-'||LTRIM(TO_CHAR(s_sys_num_seq.NEXTVAL,'00009')), SYSDATE,
	L_COD_PROC_PAR, L_TIPO_MSG, L_MESSAGGIO, L_SQL_CODE, L_SQL_ERRM);

--	COMMIT;

	--- aggiorno il numero dell'ultima elaborazione della procedura SYS_WR_LOG
	BEGIN
		UPDATE T_SYS_TAB_PROCEDURE
		SET ULTIMA_ELABORAZIONE=(SELECT ULTIMA_ELABORAZIONE+1 FROM T_SYS_TAB_PROCEDURE WHERE (NOME_PROCEDURA = L_NOME_PROC))
		WHERE (NOME_PROCEDURA = L_NOME_PROC);
	EXCEPTION
		WHEN OTHERS THEN
			L_SQL_CODE:=SQLCODE;
			L_SQL_ERRM:=SQLERRM;

			INSERT INTO T_SYS_TAB_LOG
			(PROGRESSIVO, DT_ELAB,
			COD_PROC, TIPO_MSG, MESSAGGIO, SQL_CODE, SQL_ERRM)
			VALUES
			(LTRIM(TO_CHAR(L_NUM,'00009'))||'-'||LTRIM(TO_CHAR(s_SYS_NUM_SEQ.NEXTVAL,'00009')), SYSDATE,
			L_COD_PROC, 'ERR', 'T_SYS_TAB_PROCEDURE - UPDATE', L_SQL_CODE, L_SQL_ERRM);
	END;

	--- aggiorno il numero dell'ultima elaborazione della procedura passata come parametro
	BEGIN
		UPDATE T_SYS_TAB_PROCEDURE
		SET ULTIMA_ELABORAZIONE=(SELECT ULTIMA_ELABORAZIONE+1 FROM T_SYS_TAB_PROCEDURE WHERE (NOME_PROCEDURA = P_NOME_PROC))
		WHERE (NOME_PROCEDURA = P_NOME_PROC);
	EXCEPTION
		WHEN OTHERS THEN
			L_SQL_CODE:=SQLCODE;
			L_SQL_ERRM:=SQLERRM;

			INSERT INTO T_SYS_TAB_LOG
			(PROGRESSIVO, DT_ELAB,
			COD_PROC, TIPO_MSG, MESSAGGIO, SQL_CODE, SQL_ERRM)
			VALUES
			(LTRIM(TO_CHAR(L_NUM,'00009'))||'-'||LTRIM(TO_CHAR(s_SYS_NUM_SEQ.NEXTVAL,'00009')), SYSDATE,
			L_COD_PROC_PAR, 'ERR', 'T_SYS_TAB_PROCEDURE - UPDATE', L_SQL_CODE, L_SQL_ERRM);
	END;

	COMMIT;
------ FINE corpo della procedura ------

EXCEPTION
	WHEN OTHERS THEN
		L_SQL_CODE:=SQLCODE;
		L_SQL_ERRM:=SQLERRM;

		INSERT INTO T_SYS_TAB_LOG
		(PROGRESSIVO, DT_ELAB,
		COD_PROC, TIPO_MSG, MESSAGGIO, SQL_CODE, SQL_ERRM)
		VALUES
		(LTRIM(TO_CHAR(L_NUM,'00009'))||'-'||LTRIM(TO_CHAR(s_SYS_NUM_SEQ.NEXTVAL,'00009')), SYSDATE,
		L_COD_PROC, 'ERR', 'SYS_TAB_LOG - INSERT', L_SQL_CODE, L_SQL_ERRM);

END P_SYS_WR_LOG;
/

CREATE OR REPLACE PROCEDURE "P_SYS_WR_LOG_END"("P_NOME_PROC" IN VARCHAR2)    IS 
/**************************************************************************************************
   NAME           : P_SYS_WR_LOG_END
   PURPOSE        : scrive il log di fine della proc/funz 

   NOTE           : 
   EXAMPLE USE      :

   PARAMETERS
    P_NOME_PROC         IN VARCHAR : nome della proc/funz che finisce 

   REVISIONS
   Ver        Date        Author                  Description
   ---------  ----------  ----------------------  ------------------------------------------------
   0.0        12/10/2007    De Torre Giorgio        creazione
   x.x        %DATE%      %username%              %description%

**************************************************************************************************/
--- variabili locali
----- obbligatorie
    l_ret_out        NUMBER;        -- serve a salvare l'esito della proc corrente (0 ok, >0 sqlcode errore)
    l_ret_out_sub    NUMBER;        -- serve a salvare l'esito di una proc richiamata (0 ok, >0 sqlcode errore)
    l_nome_proc    VARCHAR2(30);
    l_messaggio    VARCHAR2(1000);

----- altre
    l_numrowsel     NUMBER;
       l_step            VARCHAR(10);
    l_return         varchar2(100);
    l_partname      varchar2(100);
    l_subpartname   varchar2(100);
    l_cmdsql        VARCHAR2(2000);
     

BEGIN
--    SYS_NEW_ELAB;                -- Attivare solo se questa è la proc principale !!!
    L_NOME_PROC := 'P_SYS_WR_LOG_END';     -- inserire il nome della proc IN MAIUSCOLO deve essere identica in SYS_TAB_PROCEDURE
    --- scrivo il log di inizio
    P_SYS_WR_LOG(P_NOME_PROC, 'LOG','Fine', SQLCODE, SQLERRM);

------ FINE corpo della procedura ------
    COMMIT;

--- gestione errore generale per la procedura. Qualsiasi errore viene intercettato qui.
EXCEPTION
    WHEN OTHERS THEN
        l_ret_out := SQLCODE;
        P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica', SQLCODE, SQLERRM);
--      ROLLBACK;    -- in questo modo si ritorna alla situazione precedente l'errore
--      RAISE;        -- in questo modo si passa il sqlcode alla proc/fun chiamante
END P_SYS_WR_LOG_END;
/

CREATE OR REPLACE PROCEDURE "P_SYS_WR_LOG_START"("P_NOME_PROC" IN VARCHAR2)    IS 
/**************************************************************************************************
   NAME           : P_SYS_WR_LOG_START
   PURPOSE        : scrive il log di inizio della proc/funz 

   NOTE           : 
   EXAMPLE USE      :

   PARAMETERS
    P_NOME_PROC         IN VARCHAR : nome della proc/funz che parte 

   REVISIONS
   Ver        Date        Author                  Description
   ---------  ----------  ----------------------  ------------------------------------------------
   0.0        12/10/2007    De Torre Giorgio        creazione
   x.x        %DATE%      %username%              %description%

**************************************************************************************************/
--- variabili locali
----- obbligatorie
    l_ret_out        NUMBER;        -- serve a salvare l'esito della proc corrente (0 ok, >0 sqlcode errore)
    l_ret_out_sub    NUMBER;        -- serve a salvare l'esito di una proc richiamata (0 ok, >0 sqlcode errore)
    l_nome_proc    VARCHAR2(30);
    l_messaggio    VARCHAR2(1000);

----- altre
    l_numrowsel     NUMBER;
       l_step            VARCHAR(10);
    l_return         varchar2(100);
    l_partname      varchar2(100);
    l_subpartname   varchar2(100);
    l_cmdsql        VARCHAR2(2000);
     

BEGIN
--    SYS_NEW_ELAB;                -- Attivare solo se questa è la proc principale !!!
    L_NOME_PROC := 'P_SYS_WR_LOG_START';     -- inserire il nome della proc IN MAIUSCOLO deve essere identica in SYS_TAB_PROCEDURE
    --- scrivo il log di inizio
    P_SYS_WR_LOG(P_NOME_PROC, 'LOG','Inizio', SQLCODE, SQLERRM);

------ FINE corpo della procedura ------
    COMMIT;

--- gestione errore generale per la procedura. Qualsiasi errore viene intercettato qui.
EXCEPTION
    WHEN OTHERS THEN
        l_ret_out := SQLCODE;
        P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica', SQLCODE, SQLERRM);
--      ROLLBACK;    -- in questo modo si ritorna alla situazione precedente l'errore
--      RAISE;        -- in questo modo si passa il sqlcode alla proc/fun chiamante
END P_SYS_WR_LOG_START;
/

CREATE OR REPLACE PROCEDURE "P_SYS_EXEC_DDL"
("CMD_SQL" IN VARCHAR2,  "CALL_PROC" IN VARCHAR2,  "RETCODE" OUT NOCOPY NUMBER,  "P_AS_USER" IN VARCHAR2 default '&USER_NAME')    IS 
/**************************************************************************************************
   NAME        : P_SYS_EXEC_DDL
   PURPOSE    : esegue SQL dinamico e traccia su P_TAB_LOG il risultato dell'esecuzione
                in funzione del parametro P_as_user l'escuzione viene rediretta alla procedure sullo schema indicato 
   NOTE        :
   EXAMPLE USE    : P_SYS_EXEC_DDL (l_istruzione, l_nome_proc , ret_out );

   PARAMETERS
   CMD_SQL varchar2    : comando SQL da eseguire senza punto e virgola (;)
   CALL_PROC varchar2    : nome della procedura che esegue CMD_SQL
   RETCODE out number     : codice errore ritorno
   p_as_user varchar2   : indica lo schema sul quale effettuare il comando
     
   REVISIONS
   Ver        Date        Author                  Description
   ---------  ----------  ----------------------  ------------------------------------------------
   1.0        21/10/2008  De Torre Giorgio        Creazione procedura
   x.x        %DATE%  %username%      %description%

**************************************************************************************************/
--- variabili locali
----- obbligatorie
    l_return        NUMBER;        -- serve a salvare l'esito della proc corrente (0 ok, >0 sqlcode errore)
    l_ret_out_sub   NUMBER;        -- serve a salvare l'esito di una proc richiamata (0 ok, >0 sqlcode errore)
    l_nome_proc     VARCHAR2(30);
    l_messaggio     VARCHAR2(1000);
    l_step            VARCHAR2(10);

----- altre
    cursor1         INTEGER;
    rows_processed  INTEGER;
    l_cod_proc      VARCHAR2(5);
    l_call_proc     VARCHAR2(30);
    l_sqlcode       NUMBER;
    l_sqlerrm       VARCHAR2(255);
    l_tipoerr       VARCHAR2(3);

BEGIN
    L_NOME_PROC :='P_SYS_EXEC_DDL';
    --- scrivo il log di inizio
--    P_SYS_WR_LOG_START(L_NOME_PROC);
    l_step:='1';
------ INIZIO corpo della procedura ------

    case 
       WHEN p_as_user ='ABACUS_UNITST_CREATOR' THEN
            l_step:='20';
            ABACUS_UNITST_CREATOR.P_SYS_EXEC_DDL_owner (CMD_SQL, CALL_PROC ,l_ret_out_sub,p_as_user );

       WHEN p_as_user ='ABACUS_UNITST' THEN
            l_step:='30';
            ABACUS_UNITST.P_SYS_EXEC_DDL_owner (CMD_SQL, CALL_PROC ,l_ret_out_sub,p_as_user );
       ELSE
            l_step:='40';
            P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Lo schema indicato non è previsto !', -1, 'Lo schema indicato non è previsto !');
    END CASE;

------ FINE corpo della procedura ------
    l_step:='99';

    -- scrivo il log di fine
--    P_SYS_WR_LOG_END(L_NOME_PROC);
    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        retcode:=SQLCODE;
        P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception finale NO_DATA_FOUND (step='||l_step||')', SQLCODE, SQLERRM);
    WHEN OTHERS THEN
        retcode:=SQLCODE;
        P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica (step='||l_step||')', SQLCODE, SQLERRM);
END P_SYS_EXEC_DDL;
/

CREATE OR REPLACE PROCEDURE "P_SYS_EXEC_DDL_OWNER"("CMD_SQL" IN VARCHAR2,  "CALL_PROC" IN VARCHAR2,  "RETCODE" OUT NOCOPY NUMBER,  "P_AS_USER" IN VARCHAR2)    IS 
/**************************************************************************************************
   NAME        : P_SYS_EXEC_DDL
   PURPOSE    : esegue SQL dinamico e traccia su P_TAB_LOG il risultato dell'esecuzione

   NOTE        :
   EXAMPLE USE    : P_SYS_EXEC_DDL (l_istruzione, l_nome_proc , ret_out );

   PARAMETERS
   CMD_SQL varchar2    : comando SQL da eseguire senza punto e virgola (;)
   CALL_PROC varchar2    : nome della procedura che esegue CMD_SQL
   RETCODE out number     : codice errore ritorno

   REVISIONS
   Ver        Date        Author                  Description
   ---------  ----------  ----------------------  ------------------------------------------------
   1.0          01/05/2001  De Torre Giorgio      Creazione procedura
   1.1          03/01/2002  De Torre Giorgio      eliminato log su tabella P_TAB_LOG_DDL
   1.2          24/01/2002  De Torre Giorgio      modifiche per standard e commenti
   1.3          15/12/2003  De Torre Giorgio      modifiche messaggi
   x.x        %DATE%  %username%      %description%

**************************************************************************************************/
--- variabili locali
----- obbligatorie
    l_return        NUMBER;        -- serve a salvare l'esito della proc corrente (0 ok, >0 sqlcode errore)
    l_ret_out_sub   NUMBER;        -- serve a salvare l'esito di una proc richiamata (0 ok, >0 sqlcode errore)
    l_nome_proc     VARCHAR2(30);
    l_messaggio     VARCHAR2(1000);
    l_step            VARCHAR2(10);

----- altre
    cursor1         INTEGER;
    rows_processed  INTEGER;
    l_cod_proc      VARCHAR2(5);
    l_call_proc     VARCHAR2(30);
    l_sqlcode       NUMBER;
    l_sqlerrm       VARCHAR2(255);
    l_tipoerr       VARCHAR2(3);

BEGIN
    L_NOME_PROC :='P_SYS_EXEC_DDL_OWNER';
    --- scrivo il log di inizio
    P_SYS_WR_LOG_START(L_NOME_PROC);

------ INIZIO corpo della procedura ------
    L_SQLCODE :=0;
    L_SQLERRM :='Esecuzione terminata correttamente';

        IF CALL_PROC = '' THEN
            L_CALL_PROC := L_NOME_PROC;
        ELSE
            L_CALL_PROC := CALL_PROC;          -- nome procedura !
        END IF;

        BEGIN

            CURSOR1 := DBMS_SQL.OPEN_CURSOR;
    --        DBMS_SQL.PARSE(CURSOR1, CMD_SQL, DBMS_SQL.V7);
            DBMS_SQL.PARSE(CURSOR1, CMD_SQL, DBMS_SQL.NATIVE);
            ROWS_PROCESSED := DBMS_SQL.EXECUTE(CURSOR1);
            DBMS_SQL.CLOSE_CURSOR(CURSOR1);

        EXCEPTION
            WHEN OTHERS THEN
                IF DBMS_SQL.IS_OPEN(CURSOR1) THEN
                    DBMS_SQL.CLOSE_CURSOR(CURSOR1);
                END IF;
                L_SQLCODE := SQLCODE;
                L_SQLERRM := SQLERRM;
                P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'called from '||L_CALL_PROC||' - Comando DDL <'||CMD_SQL||'>', L_SQLCODE, L_SQLERRM);
        END;

        --- scrivo un messaggio con il nome della proc chiamante e l'esito del comando
        IF ROWS_PROCESSED=0 then
            L_TIPOERR:='LOG';
            l_messaggio:=sys_context( 'USERENV', 'CURRENT_SCHEMA')||' HA eseguito <'||CMD_SQL||'> ';
        ELSE
            L_TIPOERR:='ERR';
            l_messaggio:=sys_context( 'USERENV', 'CURRENT_SCHEMA')||' NON HA eseguito <'||CMD_SQL||'> ';
        END IF;

        retcode:=L_SQLCODE;
        P_SYS_WR_LOG (L_CALL_PROC, L_TIPOERR, l_messaggio, retcode, L_SQLERRM);
------ FINE corpo della procedura ------

    -- aggiorno il numero dell'ultima elaborazione della procedura
--    BEGIN
--        UPDATE P_TAB_PROCEDURE
--        SET ULTIMA_ELABORAZIONE=(SELECT ULTIMA_ELABORAZIONE+1 FROM P_TAB_PROCEDURE WHERE (NOME_PROCEDURA = L_NOME_PROC))
--        WHERE (CODICE_PROCEDURA=L_COD_PROC);
--    EXCEPTION
--        WHEN OTHERS THEN
----            P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'P_TAB_PROCEDURE UPDATE', SQLCODE, SQLERRM);
--    END;

    -- scrivo il log di fine
    P_SYS_WR_LOG_END(L_NOME_PROC);
    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        retcode:=SQLCODE;
        P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception finale NO_DATA_FOUND (step='||l_step||')', SQLCODE, SQLERRM);
    WHEN OTHERS THEN
        retcode:=SQLCODE;
        P_SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica (step='||l_step||')', SQLCODE, SQLERRM);
END P_SYS_EXEC_DDL_OWNER;
/


