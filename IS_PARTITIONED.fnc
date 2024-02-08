CREATE OR REPLACE FUNCTION sys_is_partitioned
(p_type_obj in varchar2,p_owner_obj in varchar2, p_name_obj in varchar2 )
return varchar2
AS
/**************************************************************************************************
   NAME           : sys_is_partitioned 
   PURPOSE        : %purpose% 

   NOTE           : modello base per funzione 
   EXAMPLE USE	  :

   PARAMETERS 
    p_type_obj in varchar2  tipo di oggetto (TAB/IND) 
    p_owner_obj in varchar2  owner dell'oggetto 
    p_name_obj in varchar2  nome dell'oggetto 

   RITORNA 	varchar2
            0 'NORMAL';
            1 'PART';
            2 'SUBPART';
            SQLCODE errore
            null parametro non corretto

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
	l_numrowins     NUMBER;
	l_numrowupd     NUMBER;
	l_numrowdel     NUMBER;
   	l_step	    	VARCHAR(10);
	l_return 	    varchar2(10);
    l_type_obj      varchar2(3);

BEGIN
--	SYS_NEW_ELAB;				-- Attivare solo se questa è la proc principale !!!
	L_NOME_PROC := 'SYS_IS_PARTITIONED'; 	-- inserire il nome della proc IN MAIUSCOLO deve essere identica in SYS_TAB_FUNCTION
	--- scrivo il log di inizio
--	SYS_WR_LOG_START (L_NOME_PROC,l_ret_out_sub);

------ INIZIO corpo della procedura ------
   	l_time_begin := NVL(TO_CHAR(SYSDATE,'sssss'),0);
	l_ret_out := 0;				-- inizializzo l'eventuale ritorno dell'esito della proc
	l_step:='1';				-- serve per identificare la parte dove si verifica un errore generico

    l_type_obj:=upper(p_type_obj);
    
    if l_type_obj <> 'TAB' and l_type_obj <> 'IND' then
--    	SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Parametro <tipo oggetto> errato', 0,null);
        return null;
    end if;

    case 
        when l_type_obj = 'TAB' then
        BEGIN
            SELECT  
            case 
            when sp.SUBPARTITION_NAME is not null then 2
            when p.PARTITION_NAME is not null then 1
            else 0 end case into l_ret_out 
            FROM  
            ALL_TABLES t
            ,ALL_TAB_PARTITIONS p
            ,ALL_TAB_SUBPARTITIONS sp
            WHERE t.owner LIKE upper(p_owner_obj) 
            and t.TABLE_NAME like upper(p_name_obj)
            and t.TABLE_NAME=p.TABLE_NAME(+)
            and t.OWNER = p.TABLE_OWNER(+)
            and t.TABLE_NAME=sp.TABLE_NAME(+)
            and t.OWNER = sp.TABLE_OWNER(+)
            and rownum=1;
        EXCEPTION
        	WHEN NO_DATA_FOUND THEN
            l_ret_out:=0;
        END;

     

        when l_type_obj = 'IND' then
        BEGIN
           SELECT  1 into l_ret_out
          FROM all_ind_partitions
         WHERE index_owner = upper(p_owner_obj) 
         AND index_name = upper(p_name_obj);
        EXCEPTION
        	WHEN NO_DATA_FOUND  THEN
            l_ret_out:=0;
        END;

        BEGIN
           SELECT  2 into l_ret_out
          FROM all_ind_subpartitions
         WHERE index_owner = upper(p_owner_obj) 
         AND index_name = upper(p_name_obj);
        EXCEPTION
        	WHEN NO_DATA_FOUND  THEN
            l_ret_out:=0;
        END;
    end case; 
            

    case 
    when l_ret_out =0 then
        l_return:='NORMAL';
    when l_ret_out =1 then
        l_return:='PART';
    when l_ret_out =2 then
        l_return:='SUBPART';
    end case; 
            
------ FINE corpo della procedura ------
	l_step:='9';

	--- scrivo il log di fine
   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   	Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
--	SYS_WR_LOG_END (L_NOME_PROC, l_ret_out_sub);

	return l_return;
--- gestione errore generale per la procedura. Qualsiasi errore viene intercettato qui.
EXCEPTION
	WHEN OTHERS THEN
		l_return := SQLCODE;
	   	l_time_elapsed :=  NVL(TO_CHAR(SYSDATE,'sssss'),0)-l_time_begin;
--   		Sys_Wr_Log (l_nome_proc, 'TIM', 'Tempo impiegato : ' || TO_CHAR(TO_DATE(l_time_elapsed,'sssss'),'hh24.mi.ss'), SQLCODE, SQLERRM);
--		SYS_WR_LOG (L_NOME_PROC, 'ERR', 'Exception OTHERS generica (step='||l_step||')', SQLCODE, SQLERRM);
--      ROLLBACK;	-- in questo modo si ritorna alla situazione precedente l'errore
--      RAISE;		-- in questo modo si passa il sqlcode alla proc/fun chiamante
		return l_return;

END sys_is_partitioned ; 
/

