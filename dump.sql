--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_aggrupation; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_aggrupation (
    id integer NOT NULL,
    name character varying,
    description character varying,
    router character varying NOT NULL,
    field_id integer
);


ALTER TABLE public.admin_aggrupation OWNER TO admin;

--
-- Name: admin_aggrupation_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_aggrupation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_aggrupation_id_seq OWNER TO admin;

--
-- Name: admin_aggrupation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_aggrupation_id_seq OWNED BY public.admin_aggrupation.id;


--
-- Name: admin_aggrupation_option; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_aggrupation_option (
    id integer NOT NULL,
    percentage integer NOT NULL,
    field_id integer,
    aggrupation_id integer
);


ALTER TABLE public.admin_aggrupation_option OWNER TO admin;

--
-- Name: admin_aggrupation_option_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_aggrupation_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_aggrupation_option_id_seq OWNER TO admin;

--
-- Name: admin_aggrupation_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_aggrupation_option_id_seq OWNED BY public.admin_aggrupation_option.id;


--
-- Name: admin_condition; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_condition (
    id integer NOT NULL,
    field_id integer,
    min double precision,
    max double precision,
    allowed character varying[],
    allowed_na boolean,
    "order" integer,
    rule_id integer NOT NULL
);


ALTER TABLE public.admin_condition OWNER TO admin;

--
-- Name: admin_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_condition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_condition_id_seq OWNER TO admin;

--
-- Name: admin_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_condition_id_seq OWNED BY public.admin_condition.id;


--
-- Name: admin_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_config (
    id integer NOT NULL,
    variable character varying NOT NULL,
    key character varying,
    value character varying NOT NULL
);


ALTER TABLE public.admin_config OWNER TO admin;

--
-- Name: admin_config_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_config_id_seq OWNER TO admin;

--
-- Name: admin_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_config_id_seq OWNED BY public.admin_config.id;


--
-- Name: admin_decision_matrix; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_decision_matrix (
    id integer NOT NULL,
    rule_id integer,
    scores integer[],
    action_id integer,
    action_info character varying
);


ALTER TABLE public.admin_decision_matrix OWNER TO admin;

--
-- Name: admin_decision_matrix_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_decision_matrix_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_decision_matrix_id_seq OWNER TO admin;

--
-- Name: admin_decision_matrix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_decision_matrix_id_seq OWNED BY public.admin_decision_matrix.id;


--
-- Name: admin_discretization; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_discretization (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    field_id integer,
    target_id integer,
    pyme_express boolean DEFAULT false,
    pyme_traditional boolean DEFAULT false,
    factoring boolean DEFAULT false
);


ALTER TABLE public.admin_discretization OWNER TO admin;

--
-- Name: admin_discretization_condition; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_discretization_condition (
    id integer NOT NULL,
    field_id integer,
    "order" integer,
    min double precision,
    max double precision,
    allowed character varying[],
    allowed_na boolean,
    final_value double precision,
    discretization_id integer
);


ALTER TABLE public.admin_discretization_condition OWNER TO admin;

--
-- Name: admin_discretization_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_discretization_condition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_discretization_condition_id_seq OWNER TO admin;

--
-- Name: admin_discretization_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_discretization_condition_id_seq OWNED BY public.admin_discretization_condition.id;


--
-- Name: admin_discretization_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_discretization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_discretization_id_seq OWNER TO admin;

--
-- Name: admin_discretization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_discretization_id_seq OWNED BY public.admin_discretization.id;


--
-- Name: admin_field; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_field (
    id integer NOT NULL,
    field character varying NOT NULL
);


ALTER TABLE public.admin_field OWNER TO admin;

--
-- Name: admin_field_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_field_id_seq OWNER TO admin;

--
-- Name: admin_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_field_id_seq OWNED BY public.admin_field.id;


--
-- Name: admin_rule; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_rule (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    pyme_express boolean DEFAULT false,
    pyme_traditional boolean DEFAULT false,
    "order" integer,
    action_id integer
);


ALTER TABLE public.admin_rule OWNER TO admin;

--
-- Name: admin_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_rule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_rule_id_seq OWNER TO admin;

--
-- Name: admin_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_rule_id_seq OWNED BY public.admin_rule.id;


--
-- Name: admin_score; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_score (
    id integer NOT NULL,
    min double precision NOT NULL,
    max double precision NOT NULL,
    name character varying,
    router character varying,
    score double precision NOT NULL,
    cme double precision
);


ALTER TABLE public.admin_score OWNER TO admin;

--
-- Name: admin_score_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_score_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_score_id_seq OWNER TO admin;

--
-- Name: admin_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_score_id_seq OWNED BY public.admin_score.id;


--
-- Name: admin_score_option; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_score_option (
    id integer NOT NULL,
    min double precision,
    max double precision,
    value character varying,
    ratio double precision,
    rule_id integer
);


ALTER TABLE public.admin_score_option OWNER TO admin;

--
-- Name: admin_score_option_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_score_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_score_option_id_seq OWNER TO admin;

--
-- Name: admin_score_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_score_option_id_seq OWNED BY public.admin_score_option.id;


--
-- Name: admin_score_rule; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_score_rule (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    field_id integer,
    weight double precision NOT NULL,
    pyme_express boolean DEFAULT false,
    pyme_traditional boolean DEFAULT false,
    factoring boolean DEFAULT false,
    use_field_value boolean DEFAULT false
);


ALTER TABLE public.admin_score_rule OWNER TO admin;

--
-- Name: admin_score_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_score_rule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_score_rule_id_seq OWNER TO admin;

--
-- Name: admin_score_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_score_rule_id_seq OWNED BY public.admin_score_rule.id;


--
-- Name: admin_status; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_status (
    id integer NOT NULL,
    status character varying NOT NULL,
    weight double precision NOT NULL
);


ALTER TABLE public.admin_status OWNER TO admin;

--
-- Name: admin_status_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_status_id_seq OWNER TO admin;

--
-- Name: admin_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_status_id_seq OWNED BY public.admin_status.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO admin;

--
-- Name: creditapplication; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.creditapplication (
    id integer NOT NULL,
    id_external character varying NOT NULL,
    is_client character varying NOT NULL,
    router character varying NOT NULL,
    n_employees integer,
    operation_antiquity character varying,
    economic_sector character varying,
    product_requested character varying,
    rate double precision,
    term_months integer,
    payment_method_equity character varying,
    payment_method_interest character varying,
    credit_destiny character varying,
    requested_amount double precision,
    regional character varying,
    business_group character varying,
    statements_date character varying,
    currency character varying,
    insert_date timestamp without time zone,
    update_date timestamp without time zone,
    rule_id integer,
    rule_info character varying,
    rule_history json,
    score_id integer,
    score double precision,
    score_history json,
    business_profile character varying,
    aggrupation_history json,
    risk_level character varying,
    line_factor double precision,
    line_granted double precision,
    action_id integer,
    action_info character varying,
    "limit" double precision,
    max_debt_service double precision,
    manual_action_id integer,
    manual_action_info character varying,
    application_date character varying NOT NULL,
    line_text character varying,
    recommendation character varying
);


ALTER TABLE public.creditapplication OWNER TO admin;

--
-- Name: creditapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.creditapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creditapplication_id_seq OWNER TO admin;

--
-- Name: creditapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.creditapplication_id_seq OWNED BY public.creditapplication.id;


--
-- Name: factoring_indicator; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.factoring_indicator (
    id integer NOT NULL,
    naira_id integer NOT NULL,
    net_utility_ltm double precision[],
    equity_last_3_years double precision[],
    sales_ltm double precision[],
    financial_liability_total double precision,
    cash double precision,
    ebitda_ltm double precision[],
    operation_flow double precision,
    total_assets double precision,
    stockholders_equity double precision[],
    credit_balance_active_bureau double precision,
    paydex_12 double precision,
    deliquency_score double precision,
    cessation_score double precision,
    viability_score double precision,
    wallet_comparison double precision,
    company_profile character varying,
    total_liabilities double precision,
    free_cashflow double precision,
    warranty_type character varying,
    warranty_value double precision,
    score_qualitative double precision,
    monex_payment_experience integer,
    actual_delay double precision,
    max_delays_12m integer,
    days_delay integer,
    amount_delay double precision,
    legal_events character varying,
    data_intensity double precision,
    invoices double precision,
    line_max_calculation double precision,
    score_quantitative double precision,
    government_dependencies character varying,
    economic_activity character varying,
    warranties character varying,
    esg character varying,
    current_asssets double precision,
    current_liabilities double precision,
    exchange_op integer,
    factoring integer,
    active_credits integer,
    default_29 integer,
    default_59 integer,
    default_89 integer,
    default_119 integer,
    default_179 integer,
    default_more integer,
    breaks integer,
    restructures integer,
    var_1m_debt integer,
    var_1y_debt integer,
    bureau_alert integer,
    endorsement_1 character varying,
    endorsement_2 character varying,
    endorsement_3 character varying,
    score_paydex double precision,
    score_deliquency double precision,
    score_cessation double precision,
    score_viability double precision,
    score_comparisson double precision,
    score_company double precision,
    payment_behaviour double precision,
    score_payment_behaviour double precision,
    score_days_delay double precision,
    score_legal_events character varying,
    score_data_intensity character varying,
    score_days_delays character varying,
    business_profile character varying,
    exec_time character varying
);


ALTER TABLE public.factoring_indicator OWNER TO admin;

--
-- Name: factoring_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.factoring_indicator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factoring_indicator_id_seq OWNER TO admin;

--
-- Name: factoring_indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.factoring_indicator_id_seq OWNED BY public.factoring_indicator.id;


--
-- Name: leasing_indicator; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.leasing_indicator (
    id integer NOT NULL,
    naira_id integer NOT NULL,
    anual_sales double precision[],
    net_utility_ltm double precision[],
    equity_last_3_years double precision[],
    sales_ltm double precision[],
    cash double precision,
    ebitda_ltm double precision[],
    operation_flow double precision,
    total_assets double precision,
    stockholders_equity double precision[],
    max_bureau_line double precision,
    credit_balance_active_bureau double precision,
    anual_inferred_income double precision,
    total_liabilities double precision,
    free_cashflow double precision,
    warranty_type character varying,
    warranty_value double precision,
    endorsement_1 character varying,
    endorsement_2 character varying,
    endorsement_3 character varying,
    shareholder_experience integer,
    business_stability integer,
    monex_payment_experience integer,
    monex_client_antiquity integer,
    credit_antiquity integer,
    actual_delay double precision,
    historic_delay double precision,
    payment_bureau_behaviour character varying,
    historic_behaviour character varying,
    max_delays_12m integer,
    days_delay integer,
    amount_delay double precision,
    profitability double precision,
    observation_keys integer,
    esg character varying,
    liquid_pledge character varying,
    sum_wallet_more_31 integer,
    active_credits integer,
    default_29 integer,
    default_59 integer,
    default_89 integer,
    default_119 integer,
    default_179 integer,
    default_more integer,
    breaks integer,
    restructures integer,
    var_1m_debt integer,
    var_1y_debt integer,
    bureau_alert integer,
    term_years double precision,
    payment_capacity double precision,
    adjusted_payment_capacity double precision,
    adjusted_max_bureau_line double precision,
    line_score double precision,
    line_proposal_selection character varying,
    line_proposal double precision,
    line_factor1 double precision,
    line_factor2 double precision,
    line_product double precision,
    line_proposal_final character varying,
    leverage double precision,
    score_leverage double precision,
    score_quantitative double precision,
    score_operation_antiquity double precision,
    score_shareholder_experience double precision,
    score_business_stability double precision,
    score_qualitative double precision,
    score_monex_payment_experience double precision,
    score_antiquity_client double precision,
    score_antiquity_no_client double precision,
    score_credit_antiquity double precision,
    score_payment_bureau_behaviour double precision,
    score_historic_behaviour double precision,
    actual_delay_amount double precision,
    historic_delay_amount double precision,
    relevant_delays double precision,
    score_relevant_delays double precision,
    line_proposal_max_bureau double precision,
    score_credit_relevance double precision,
    score_observation_keys double precision,
    score_behaviour double precision,
    score_anual_inferred_income character varying,
    economic_sector_adjustment character varying,
    score_economic_sector character varying,
    score_esg character varying,
    score_liquid_pledge character varying,
    score_profitability character varying,
    score_sum_wallet_more_31 character varying,
    solvency double precision,
    score_solvency character varying,
    business_profile character varying,
    exec_time character varying
);


ALTER TABLE public.leasing_indicator OWNER TO admin;

--
-- Name: leasing_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.leasing_indicator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leasing_indicator_id_seq OWNER TO admin;

--
-- Name: leasing_indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.leasing_indicator_id_seq OWNED BY public.leasing_indicator.id;


--
-- Name: pyme_express_indicator; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.pyme_express_indicator (
    id integer NOT NULL,
    naira_id integer NOT NULL,
    business_profile character varying,
    line_granted double precision,
    exec_time character varying,
    requested_amount double precision NOT NULL,
    anual_inferred_income double precision,
    sum_active_balance double precision,
    operation_antiquity double precision,
    monex_payment_experience character varying,
    bureau_actual_behaviour character varying,
    max_actual_delay_amount double precision,
    bureau_historic_behaviour character varying,
    max_historic_delay_amount double precision,
    credit_antiquity double precision,
    observation_key integer,
    prevention_key integer,
    esg character varying,
    liquid_pledge character varying,
    is_client character varying,
    profitability_monex double precision,
    economic_sector character varying,
    line_max_historic double precision,
    score_leverage integer,
    score_operation_antiquity double precision,
    score_monex_payment_experience double precision,
    score_bureau_actual_behaviour double precision,
    score_payment_actual_bureau_behaviour double precision,
    score_bureau_historic_behaviour double precision,
    score_payment_historic_bureau_behaviour double precision,
    score_credit_antiquity double precision,
    score_credit_relevance double precision,
    score_observation_prevention_keys double precision,
    rule_anual_inferred_income character varying,
    rule_economic_sector character varying,
    rule_esg character varying,
    rule_liquid_pledge character varying,
    rule_profitability_monex character varying,
    min_values double precision,
    score_payment_actual_bureau_behaviour_final double precision,
    score_payment_historic_bureau_behaviour_final double precision,
    leverage double precision,
    score_target_credit_relevance double precision,
    score_target_keys double precision,
    saldos_impago double precision[],
    var_deuda double precision,
    creditos_activos_aval integer,
    saldo_vencido_activas_aval double precision,
    saldo_vencido_aval double precision,
    deuda_actual_aval double precision,
    comportamientos_acreditado character varying[],
    comportamientos_aval character varying[],
    claves_acreditado character varying[],
    claves_aval character varying[],
    creditos_activos_acreditado integer,
    saldo_vencido_activas_acreditado double precision,
    saldo_vencido_acreditado double precision,
    score_buro_aval character varying,
    score_buro_acreditado character varying,
    line_max_product double precision,
    line_max_product_factor double precision,
    line_max_historic_factor double precision,
    anual_inferred_income_factor double precision,
    line_max_historic_value double precision,
    anual_inferred_income_value double precision,
    arr_periodo character varying[],
    arr_saldo double precision[],
    "arr_saldoVencido1_29" double precision[],
    "arr_saldoVencido30_59" double precision[],
    "arr_saldoVencido60_89" double precision[],
    "arr_saldoVencidoA90" double precision[],
    line_max_actual double precision,
    rule_observation_keys character varying,
    rule_antiquity character varying,
    rule_actual_delay character varying,
    rule_historic_delay character varying,
    recommendation character varying,
    score_qualitative double precision,
    score_quantitative double precision,
    score_behaviour double precision
);


ALTER TABLE public.pyme_express_indicator OWNER TO admin;

--
-- Name: pyme_express_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.pyme_express_indicator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pyme_express_indicator_id_seq OWNER TO admin;

--
-- Name: pyme_express_indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.pyme_express_indicator_id_seq OWNED BY public.pyme_express_indicator.id;


--
-- Name: pyme_traditional_indicator; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.pyme_traditional_indicator (
    id integer NOT NULL,
    naira_id integer NOT NULL,
    net_utility_ltm double precision[],
    equity_last_3_years double precision[],
    sales_ltm double precision[],
    financial_liability_total double precision,
    cash double precision,
    ebitda_ltm double precision[],
    sales_cost double precision,
    operation_expenses double precision[],
    financial_expenses_ltm double precision[],
    operation_flow double precision,
    debt_payable double precision,
    taxes_payable double precision,
    taxes_receivable double precision,
    debt_short double precision,
    debt_long double precision,
    inventories double precision,
    accounts_receivable double precision,
    total_assets double precision,
    expired_wallet double precision,
    total_wallet double precision,
    stockholders_equity double precision[],
    admin_expenses double precision,
    properties_and_equipment double precision,
    max_bureau_line double precision,
    credit_balance_active_bureau double precision,
    assets_long double precision,
    liabilities_long double precision,
    total_liabilities double precision,
    free_cashflow double precision,
    warranty_type character varying,
    warranty_value double precision,
    score_qualitative double precision,
    shareholder_experience integer,
    score_quantitative double precision,
    monex_client_antiquity integer,
    past_due_avg_days double precision,
    credit_antiquity double precision,
    actual_delay double precision,
    payment_bureau_behaviour character varying,
    max_delays_12m integer,
    days_delay integer,
    amount_delay double precision,
    score_behaviour double precision,
    government_dependencies character varying,
    economic_activity character varying,
    warranties character varying,
    esg character varying,
    current_asssets double precision,
    current_liabilities double precision,
    exchange_op character varying,
    factoring character varying,
    basic_equity double precision,
    active_credits integer,
    default_29 integer,
    default_59 integer,
    default_89 integer,
    default_119 integer,
    default_179 integer,
    default_more integer,
    breaks integer,
    restructures integer,
    var_1m_debt integer,
    var_1y_debt integer,
    bureau_alert integer,
    endorsement_1 character varying,
    endorsement_2 character varying,
    endorsement_3 character varying,
    sales_evolution double precision,
    score_sales_evolution double precision,
    roes double precision[],
    avg_roe double precision,
    score_avg_roe double precision,
    net_margins double precision[],
    avg_net_margins double precision,
    score_avg_net_margins double precision,
    financial_debt_net double precision,
    financial_debt_ebitda double precision,
    score_financial_debt_ebitda double precision,
    interest_coverage double precision,
    score_interest_converage double precision,
    cash_flow double precision,
    score_cash_flow double precision,
    days_accounts_payable double precision,
    accounts_payable_90d double precision,
    days_accounts_receivable double precision,
    accounts_receivable_90d double precision,
    adjusted_working_equity double precision,
    score_adjusted_working_equity double precision,
    inventory_days double precision,
    cash_cycle double precision,
    score_cash_cycle double precision,
    assets_rotation double precision,
    score_assets_rotation double precision,
    score_operation_antiquity double precision,
    score_shareholder_experience double precision,
    business_stability double precision,
    monex_payment_experience double precision,
    score_antiquity_client double precision,
    score_antiquity_no_client double precision,
    score_credit_antiquity double precision,
    score_max_delays_12m double precision,
    score_past_due_avg_days double precision,
    score_interest_coverage double precision,
    total_finacial_debt double precision,
    score_business_stability double precision,
    score_monex_payment_experience double precision,
    adjusted_payment_bureau_behaviour character varying,
    score_payment_bureau_behaviour character varying,
    score_operation_antiquity_rule character varying,
    economic_activity_adjustment character varying,
    profitability character varying,
    score_profitability character varying,
    score_government_dependencies character varying,
    score_esg character varying,
    property_solvency character varying,
    score_property_solvency character varying,
    exchange_op_liquity double precision,
    score_exchange_op character varying,
    wallet_quality character varying,
    score_factoring character varying,
    score_economic_activity character varying,
    score_warranties character varying,
    business_profile character varying,
    line_factor1 double precision,
    line_factor2 double precision,
    line_factor3 double precision,
    line_factor4 double precision,
    line_factor5 double precision,
    product_limit double precision,
    adjusted_max_bureau_line double precision,
    adjusted_avg_equity double precision,
    adjusted_sales_ltm double precision,
    adjusted_payment_capacity double precision,
    adjusted_equity double precision,
    line_granted double precision,
    exec_time character varying,
    mean_stockholders_equity double precision,
    mean_sales_ltm double precision,
    mean_payment_capacity double precision
);


ALTER TABLE public.pyme_traditional_indicator OWNER TO admin;

--
-- Name: pyme_traditional_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.pyme_traditional_indicator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pyme_traditional_indicator_id_seq OWNER TO admin;

--
-- Name: pyme_traditional_indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.pyme_traditional_indicator_id_seq OWNED BY public.pyme_traditional_indicator.id;


--
-- Name: reporting_indicator; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.reporting_indicator (
    id integer NOT NULL,
    naira_id integer NOT NULL,
    roe double precision,
    ebitda_margin double precision,
    utility_margin double precision,
    financial_debt_ebitda double precision,
    liquity double precision,
    leverage_rate double precision,
    net_debt_ebitda double precision,
    ebitda_liability double precision,
    ebitda_financial_liability double precision,
    sales_evolution double precision,
    ebitda_evolution double precision,
    available_balance double precision,
    financial_liability_total double precision,
    exec_time character varying
);


ALTER TABLE public.reporting_indicator OWNER TO admin;

--
-- Name: reporting_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.reporting_indicator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_indicator_id_seq OWNER TO admin;

--
-- Name: reporting_indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.reporting_indicator_id_seq OWNED BY public.reporting_indicator.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.role OWNER TO admin;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO admin;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: role_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.role_user (
    user_id integer,
    role_id integer
);


ALTER TABLE public.role_user OWNER TO admin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    "user" character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    active boolean NOT NULL,
    authenticated boolean,
    last_action timestamp without time zone
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admin_aggrupation id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_aggrupation ALTER COLUMN id SET DEFAULT nextval('public.admin_aggrupation_id_seq'::regclass);


--
-- Name: admin_aggrupation_option id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_aggrupation_option ALTER COLUMN id SET DEFAULT nextval('public.admin_aggrupation_option_id_seq'::regclass);


--
-- Name: admin_condition id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_condition ALTER COLUMN id SET DEFAULT nextval('public.admin_condition_id_seq'::regclass);


--
-- Name: admin_config id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_config ALTER COLUMN id SET DEFAULT nextval('public.admin_config_id_seq'::regclass);


--
-- Name: admin_decision_matrix id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_decision_matrix ALTER COLUMN id SET DEFAULT nextval('public.admin_decision_matrix_id_seq'::regclass);


--
-- Name: admin_discretization id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization ALTER COLUMN id SET DEFAULT nextval('public.admin_discretization_id_seq'::regclass);


--
-- Name: admin_discretization_condition id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization_condition ALTER COLUMN id SET DEFAULT nextval('public.admin_discretization_condition_id_seq'::regclass);


--
-- Name: admin_field id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_field ALTER COLUMN id SET DEFAULT nextval('public.admin_field_id_seq'::regclass);


--
-- Name: admin_rule id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_rule ALTER COLUMN id SET DEFAULT nextval('public.admin_rule_id_seq'::regclass);


--
-- Name: admin_score id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_score ALTER COLUMN id SET DEFAULT nextval('public.admin_score_id_seq'::regclass);


--
-- Name: admin_score_option id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_score_option ALTER COLUMN id SET DEFAULT nextval('public.admin_score_option_id_seq'::regclass);


--
-- Name: admin_score_rule id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_score_rule ALTER COLUMN id SET DEFAULT nextval('public.admin_score_rule_id_seq'::regclass);


--
-- Name: admin_status id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_status ALTER COLUMN id SET DEFAULT nextval('public.admin_status_id_seq'::regclass);


--
-- Name: creditapplication id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.creditapplication ALTER COLUMN id SET DEFAULT nextval('public.creditapplication_id_seq'::regclass);


--
-- Name: factoring_indicator id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.factoring_indicator ALTER COLUMN id SET DEFAULT nextval('public.factoring_indicator_id_seq'::regclass);


--
-- Name: leasing_indicator id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.leasing_indicator ALTER COLUMN id SET DEFAULT nextval('public.leasing_indicator_id_seq'::regclass);


--
-- Name: pyme_express_indicator id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pyme_express_indicator ALTER COLUMN id SET DEFAULT nextval('public.pyme_express_indicator_id_seq'::regclass);


--
-- Name: pyme_traditional_indicator id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pyme_traditional_indicator ALTER COLUMN id SET DEFAULT nextval('public.pyme_traditional_indicator_id_seq'::regclass);


--
-- Name: reporting_indicator id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reporting_indicator ALTER COLUMN id SET DEFAULT nextval('public.reporting_indicator_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admin_aggrupation; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_aggrupation (id, name, description, router, field_id) FROM stdin;
5	Score Qualitative	\N	tradicional	74
4	Score Quantitative	\N	tradicional	73
6	Score Behaviour	\N	tradicional	75
7	Score Quantitative	\N	express	188
8	Score Qualitative	\N	express	187
9	Score Behaviour	\N	express	189
\.


--
-- Data for Name: admin_aggrupation_option; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) FROM stdin;
12	10	56	4
13	10	58	4
14	10	60	4
15	20	62	4
16	10	64	4
17	10	65	4
18	10	68	4
19	10	70	4
20	10	72	4
21	40	90	5
22	30	80	5
23	30	82	5
24	10	84	6
26	30	86	6
27	30	88	6
25	30	100	6
28	100	165	7
29	100	166	8
35	25	192	9
31	25	170	9
32	25	173	9
33	25	174	9
\.


--
-- Data for Name: admin_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) FROM stdin;
23	89	\N	\N	{-}	f	1	14
25	91	\N	\N	{-}	f	3	14
26	92	\N	\N	{-}	f	4	14
27	93	\N	\N	{-}	f	5	14
28	94	\N	\N	{-}	f	6	14
29	95	\N	\N	{-}	f	7	14
30	96	\N	\N	{-}	f	8	14
31	97	\N	\N	{-}	f	9	14
32	98	\N	\N	{-}	f	10	14
33	89	\N	\N	{?}	f	1	15
35	91	\N	\N	{?}	f	3	15
36	92	\N	\N	{?}	f	4	15
37	94	\N	\N	{?}	f	5	15
38	95	\N	\N	{?}	f	6	15
39	96	\N	\N	{?}	f	7	15
40	97	\N	\N	{?}	f	8	15
41	98	\N	\N	{?}	f	9	15
42	93	\N	\N	{?}	f	10	15
43	89	\N	\N	{+}	f	1	16
45	91	\N	\N	{+}	f	3	16
46	92	\N	\N	{+}	f	4	16
47	93	\N	\N	{+}	f	5	16
48	94	\N	\N	{+}	f	6	16
49	95	\N	\N	{+}	f	7	16
50	96	\N	\N	{+}	f	8	16
51	97	\N	\N	{+}	f	9	16
52	98	\N	\N	{+}	f	10	16
24	101	\N	\N	{-}	f	2	14
34	101	\N	\N	{?}	f	2	15
44	101	\N	\N	{+}	f	2	16
58	180	\N	\N	{+}	f	1	20
59	\N	\N	\N	{-}	f	\N	21
60	177	\N	\N	{-}	f	1	22
66	178	\N	\N	{-}	f	\N	24
67	177	\N	\N	{?}	f	1	25
68	178	\N	\N	{?}	f	1	26
69	179	\N	\N	{?}	f	1	27
70	180	\N	\N	{?}	f	1	28
71	179	\N	\N	{+}	f	1	29
72	181	\N	\N	{+}	f	1	30
\.


--
-- Data for Name: admin_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_config (id, variable, key, value) FROM stdin;
1	general	aggregation_provider	UNNAX
2	general	ACCEPTED	OK
3	general	REJECTED	KO
4	general	REVIEW	Manual Review
5	general	MAX_INACTIVE_SECS	120
\.


--
-- Data for Name: admin_decision_matrix; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_decision_matrix (id, rule_id, scores, action_id, action_info) FROM stdin;
4	5	{1,2}	4	Score rejection [1,2]
5	1	{1,2,3,4,5,6}	4	Rule rejection
2	5	{3,4,5,6}	5	Needs Manual Review
3	2	{1,2}	4	Score rejection [1,2]
6	6	{1,2}	4	Score rejection [1,2]
7	6	{3,4,5,6}	3	Accept
1	2	{3,4,5,6}	3	Accept
\.


--
-- Data for Name: admin_discretization; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) FROM stdin;
13	Score Sales Evolution	\N	55	56	f	t	f
14	Score Average ROE	\N	57	58	f	t	f
15	Score Average Net Margins	\N	59	60	f	t	f
16	Score Financial Debt / EBITDA	\N	61	62	f	t	f
17	Score Interest Coverage	\N	63	64	f	t	f
18	Score Cash Flow	\N	65	66	f	t	f
19	Score Adjusted Working Equity	\N	67	68	f	t	f
20	Score Cash Cycle	\N	69	70	f	t	f
21	Score Asset Rotation	\N	71	72	f	t	f
22	Score Operation Antiquity	\N	23	90	f	t	f
23	Score Shareholder Experience	\N	79	80	f	t	f
24	Score Business Stability	\N	81	82	f	t	f
25	Score Monex Payment Experience	\N	83	84	f	t	f
26	Score Max Delays 12m	\N	85	86	f	t	f
27	Score Past Due Average Days	\N	87	88	f	t	f
28	Score_leverage	\N	146	165	t	f	f
29	Score Monex Payment Experience	\N	151	167	t	f	f
30	Score Operation Antiquity	\N	150	166	t	f	f
31	Score Credit Relevance	\N	175	191	t	f	f
32	Score Keys	\N	176	192	t	f	f
\.


--
-- Data for Name: admin_discretization_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) FROM stdin;
78	\N	1	\N	\N	{}	t	0	13
79	\N	2	-0.15	\N	{}	f	0	13
80	\N	3	-0.15	-0.1	{}	f	2	13
81	\N	4	-0.1	0	{}	f	4	13
82	\N	5	0	0.03	{}	f	6	13
83	\N	6	0.03	0.07	{}	f	8	13
84	\N	7	\N	0.07	{}	f	10	13
85	\N	1	\N	\N	{}	t	8	14
86	\N	2	-0.1	\N	{}	f	0	14
87	\N	3	-0.1	-0.02	{}	f	2	14
88	\N	4	-0.02	0.01	{}	f	4	14
89	\N	5	0.01	0.05	{}	f	6	14
90	\N	6	0.05	0.07	{}	f	8	14
91	\N	7	\N	0.07	{}	f	10	14
92	\N	1	\N	\N	{}	t	8	15
93	\N	2	-0.1	\N	{}	f	0	15
94	\N	3	-0.1	0	{}	f	2	15
95	\N	4	0	0.01	{}	f	4	15
22	\N	1	\N	\N	{1}	f	10	\N
23	\N	2	\N	\N	{2}	f	8	\N
24	\N	3	\N	\N	{3}	f	6	\N
25	\N	4	\N	\N	{4}	f	4	\N
26	\N	5	\N	\N	{5}	f	2	\N
27	\N	6	\N	\N	{6}	f	0	\N
96	\N	5	0.01	0.05	{}	f	6	15
97	\N	6	0.05	0.07	{}	f	8	15
98	\N	7	\N	0.07	{}	f	10	15
99	\N	1	\N	\N	{}	t	8	16
100	\N	2	1.5	\N	{}	f	10	16
101	\N	3	1.5	2	{}	f	8	16
102	\N	4	2	2.5	{}	f	6	16
103	\N	5	2.5	3	{}	f	4	16
104	\N	6	3	4	{}	f	2	16
34	\N	1	\N	0.5	{}	f	0	\N
46	\N	1	\N	\N	{"MOP 1"}	f	10	\N
47	\N	2	\N	\N	{"MOP 2"}	f	8	\N
69	\N	1	\N	\N	{"No presenta clave"}	f	10	\N
70	\N	2	\N	\N	{1}	f	8	\N
40	\N	1	\N	0.5	{}	f	0	\N
41	\N	2	\N	\N	{0.5}	f	2	\N
42	\N	3	0.5	0.8	{}	f	4	\N
44	\N	5	1	1.5	{}	f	8	\N
55	\N	1	\N	0.01	{}	f	10	\N
56	\N	2	\N	\N	{0.01}	f	10	\N
57	\N	3	0.01	0.02	{}	f	8	\N
2	\N	2	0.5	1	{}	f	8	\N
3	\N	3	1	2	{}	f	6	\N
4	\N	4	2	2.5	{}	f	4	\N
5	\N	5	2.5	3	{}	f	2	\N
74	\N	1	2	3	{}	f	4	\N
75	\N	2	3	5	{}	f	6	\N
76	\N	3	5	10	{}	f	8	\N
77	\N	4	10	\N	{}	f	10	\N
35	\N	2	\N	\N	{0.5}	f	2	\N
36	\N	3	0.5	1	{}	f	4	\N
37	\N	4	1	2	{}	f	6	\N
38	\N	5	2	3	{}	f	8	\N
39	\N	6	3	\N	{}	f	10	\N
48	\N	3	\N	\N	{"Sin información"}	f	4	\N
49	\N	4	\N	\N	{"MOP 3","Mayor o igual a MOP 4"}	f	0	\N
62	\N	1	\N	0.6	{}	f	10	\N
63	\N	2	\N	\N	{0.6}	f	10	\N
64	\N	3	0.6	1	{}	f	8	\N
65	\N	4	1	1.5	{}	f	6	\N
66	\N	5	1.5	2	{}	f	4	\N
67	\N	6	\N	\N	{2}	f	2	\N
68	\N	7	2	\N	{}	f	2	\N
58	\N	4	0.02	0.03	{}	f	6	\N
59	\N	5	0.03	0.04	{}	f	4	\N
71	\N	3	\N	\N	{2}	f	6	\N
72	\N	4	\N	\N	{3}	f	0	\N
73	\N	5	\N	\N	{"Sin historial"}	f	6	\N
50	\N	1	\N	\N	{"MOP 1"}	f	10	\N
51	\N	2	\N	\N	{"MOP 2"}	f	8	\N
52	\N	3	\N	\N	{"MOP 3"}	f	6	\N
53	\N	4	\N	\N	{"Sin información"}	f	4	\N
54	\N	5	\N	\N	{"Mayor o igual a MOP 4"}	f	0	\N
28	\N	1	\N	\N	{1}	f	10	\N
29	\N	2	\N	\N	{2}	f	8	\N
30	\N	3	\N	\N	{3,8}	f	6	\N
31	\N	4	\N	\N	{4}	f	4	\N
32	\N	5	\N	\N	{5}	f	2	\N
33	\N	6	\N	\N	{6,7}	f	0	\N
105	\N	7	\N	4	{}	f	0	16
106	\N	1	\N	\N	{}	t	8	17
107	\N	2	1	\N	{}	f	0	17
108	\N	3	1	1.5	{}	f	2	17
109	\N	4	1.5	2.5	{}	f	4	17
110	\N	5	2.5	4	{}	f	6	17
111	\N	6	4	7	{}	f	8	17
112	\N	7	\N	7	{}	f	10	17
113	\N	1	\N	\N	{}	t	8	18
114	\N	2	0.06	\N	{}	f	0	18
115	\N	3	0.06	0.09	{}	f	2	18
116	\N	4	0.09	0.13	{}	f	4	18
117	\N	5	0.13	0.23	{}	f	6	18
118	\N	6	0.23	0.35	{}	f	8	18
119	\N	7	0.35	\N	{}	f	10	18
120	\N	1	\N	\N	{}	t	8	19
121	\N	2	0.5	\N	{}	f	0	19
122	\N	3	0.5	0.8	{}	f	2	19
123	\N	4	0.8	1	{}	f	4	19
124	\N	5	0.8	1	{}	f	6	19
125	\N	6	1	2	{}	f	8	19
126	\N	7	2	3	{}	f	10	19
127	\N	1	\N	\N	{}	t	8	20
128	\N	2	60	\N	{}	f	10	20
129	\N	3	60	90	{}	f	8	20
130	\N	4	90	120	{}	f	6	20
131	\N	5	120	150	{}	f	4	20
132	\N	6	150	180	{}	f	2	20
133	\N	7	\N	180	{}	f	0	20
134	\N	1	\N	\N	{}	t	8	21
135	\N	2	0.02	\N	{}	f	0	21
136	\N	3	0.02	0.07	{}	f	2	21
137	\N	4	0.07	0.25	{}	f	4	21
138	\N	5	0.25	0.5	{}	f	6	21
139	\N	6	0.5	0.75	{}	f	8	21
140	\N	7	\N	0.75	{}	f	10	21
141	\N	1	\N	\N	{"Sin información"}	t	0	22
142	\N	2	2	\N	{}	f	0	22
143	\N	3	2	3	{}	f	4	22
144	\N	4	3	5	{}	f	6	22
145	\N	5	5	10	{}	f	8	22
146	\N	6	\N	10	{}	f	10	22
147	\N	1	\N	\N	{6,8,7}	t	0	23
148	\N	2	\N	\N	{5}	f	2	23
149	\N	3	\N	\N	{4}	f	4	23
150	\N	4	\N	\N	{3}	f	6	23
151	\N	5	\N	\N	{2}	f	8	23
152	\N	6	\N	\N	{1}	f	10	23
153	\N	1	\N	\N	{6}	t	0	24
154	\N	2	\N	\N	{5}	f	2	24
155	\N	3	\N	\N	{4}	f	4	24
156	\N	4	\N	\N	{3}	f	6	24
157	\N	5	\N	\N	{2}	f	8	24
158	\N	6	\N	\N	{1}	f	10	24
159	\N	1	\N	\N	{6}	f	0	25
160	\N	2	\N	\N	{5}	f	2	25
161	\N	3	\N	\N	{4}	f	4	25
162	\N	4	\N	\N	{3,7,5}	f	6	25
163	\N	5	\N	\N	{2}	f	8	25
164	\N	6	\N	\N	{1}	f	10	25
165	\N	1	\N	\N	{"Sin información"}	t	6	26
166	\N	2	\N	\N	{0}	f	10	26
167	\N	3	\N	\N	{1}	f	8	26
168	\N	4	\N	\N	{2}	f	6	26
169	\N	5	\N	\N	{3}	f	4	26
170	\N	6	\N	\N	{4}	f	2	26
171	\N	6	\N	4	{}	f	2	26
172	\N	1	\N	\N	{"Sin información"}	t	0	27
173	\N	2	\N	\N	{0}	f	10	27
174	\N	3	1	7	{}	f	8	27
175	\N	4	7	25	{}	f	6	27
176	\N	5	25	36	{}	f	4	27
177	\N	6	\N	\N	{36}	f	2	27
178	\N	7	\N	36	{}	f	2	27
14	\N	1	\N	\N	{1}	f	10	\N
15	\N	2	\N	\N	{2}	f	8	\N
16	\N	3	\N	\N	{3}	f	6	\N
17	\N	4	\N	\N	{4}	f	4	\N
18	\N	5	\N	\N	{5}	f	2	\N
19	\N	6	\N	\N	{6}	f	0	\N
20	\N	7	\N	\N	{7}	f	0	\N
21	\N	8	\N	\N	{8}	f	0	\N
60	\N	6	0.04	0.05	{}	f	2	\N
1	\N	1	\N	0.5	{}	f	10	\N
6	\N	6	3	\N	{}	f	0	\N
61	\N	7	0.05	\N	{}	f	0	\N
43	\N	4	0.8	1	{}	f	6	\N
45	\N	6	1.5	\N	{}	f	10	\N
185	\N	1	\N	\N	{"Pago siempre puntual"}	f	10	29
186	\N	2	\N	\N	{"Un atraso poco relevante"}	f	8	29
187	\N	3	\N	\N	{"Un atraso relevante"}	f	4	29
188	\N	4	\N	\N	{"Más de un atraso relevante"}	f	2	29
189	\N	5	\N	\N	{"Cliente nuevo / Sin información"}	f	8	29
195	\N	1	\N	0.6	{}	f	10	31
196	\N	2	\N	\N	{0.6}	f	10	31
197	\N	3	0.6	1	{}	f	8	31
198	\N	4	1	1.5	{}	f	6	31
199	\N	5	1.5	2	{}	f	4	31
200	\N	6	\N	\N	{2}	f	2	31
201	\N	7	2	\N	{}	f	0	31
202	\N	8	\N	\N	{}	t	0	31
203	\N	1	\N	\N	{0}	f	10	32
211	\N	3	3	5	{}	f	6	30
212	\N	4	2	3	{}	f	4	30
213	\N	5	1	2	{}	f	0	30
214	\N	6	0	1	{}	f	-18	30
206	\N	4	\N	\N	{3}	f	-15	32
216	\N	5	\N	\N	{}	t	6	32
204	\N	2	\N	\N	{1}	f	10	32
205	\N	3	\N	\N	{2}	f	2	32
179	\N	1	\N	2	{}	f	10	28
180	\N	2	2	3	{}	f	8	28
181	\N	3	3	4	{}	f	6	28
182	\N	4	4	5	{}	f	4	28
183	\N	5	5	6	{}	f	-3	28
184	\N	6	6	7	{}	f	-4	28
217	\N	7	7	\N	{}	f	-23	28
209	\N	1	7	\N	{}	f	10	30
210	\N	2	5	7	{}	f	8	30
215	\N	7	\N	\N	{-1}	f	0	30
\.


--
-- Data for Name: admin_field; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_field (id, field) FROM stdin;
146	express.leverage
147	express.requested_amount
148	express.anual_inferred_income
149	express.sum_active_balance
150	express.operation_antiquity
151	express.monex_payment_experience
152	express.bureau_actual_behaviour
153	express.max_actual_delay_amount
22	n_employees
23	operation_antiquity
154	express.bureau_historic_behaviour
155	express.max_historic_delay_amount
156	express.credit_antiquity
157	express.observation_key
158	express.prevention_key
159	express.esg
160	express.liquid_pledge
161	express.is_client
162	express.profitability_monex
163	express.economic_sector
164	express.line_max_historic
165	express.score_leverage
166	express.score_operation_antiquity
167	express.score_monex_payment_experience
168	express.score_bureau_actual_behaviour
169	express.score_payment_actual_bureau_behaviour
170	express.score_payment_actual_bureau_behaviour_final
171	express.score_bureau_historic_behaviour
172	express.score_payment_historic_bureau_behaviour
173	express.score_payment_historic_bureau_behaviour_final
174	express.score_credit_antiquity
175	express.score_credit_relevance
176	express.score_observation_prevention_keys
177	express.rule_anual_inferred_income
178	express.rule_economic_sector
179	express.rule_esg
180	express.rule_liquid_pledge
55	traditional.sales_evolution
56	traditional.score_sales_evolution
57	traditional.avg_roe
58	traditional.score_avg_roe
59	traditional.avg_net_margins
60	traditional.score_avg_net_margins
61	traditional.financial_debt_ebitda
62	traditional.score_financial_debt_ebitda
63	traditional.interest_coverage
64	traditional.score_interest_coverage
65	traditional.cash_flow
66	traditional.score_cash_flow
67	traditional.adjusted_working_equity
68	traditional.score_adjusted_working_equity
69	traditional.cash_cycle
70	traditional.score_cash_cycle
71	traditional.assets_rotation
72	traditional.score_assets_rotation
73	traditional.score_quantitative
74	traditional.score_qualitative
75	traditional.score_behaviour
79	traditional.shareholder_experience
80	traditional.score_shareholder_experience
81	traditional.business_stability
82	traditional.score_business_stability
83	traditional.monex_payment_experience
84	traditional.score_monex_payment_experience
85	traditional.max_delays_12m
86	traditional.score_max_delays_12m
87	traditional.past_due_avg_days
88	traditional.score_past_due_avg_days
89	traditional.score_payment_bureau_behaviour
90	traditional.score_operation_antiquity
91	traditional.score_economic_activity
92	traditional.score_profitability
93	traditional.score_government_dependencies
94	traditional.score_warranties
95	traditional.score_esg
96	traditional.score_property_solvency
97	traditional.score_exchange_op
98	traditional.score_factoring
99	traditional.credit_antiquity
100	traditional.score_credit_antiquity
101	traditional.score_credit_antiquity_rule
181	express.rule_profitability_monex
182	express.rule_bureau_actual_behaviour_KO
183	express.rule_bureau_actual_behaviour_text
184	express.rule_bureau_historic_behaviour_KO
185	express.rule_bureau_historic_behaviour_text
186	express.rule_keys_KO
187	express.score_qualitative
188	express.score_quantitative
189	express.score_behaviour
190	express.min_values
191	express.score_target_credit_relevance
192	express.score_target_keys
193	express.score_target_credit_relevance
194	express.score_target_keys
195	express.score_target_credit_relevance
196	express.score_target_keys
197	express.score_target_credit_relevance
198	express.score_target_keys
199	express.score_target_credit_relevance
200	express.score_target_keys
201	express.score_target_credit_relevance
202	express.score_target_keys
203	express.score_target_credit_relevance
204	express.score_target_keys
205	express.score_target_credit_relevance
206	express.score_target_keys
207	express.score_target_credit_relevance
208	express.score_target_keys
209	express.score_target_credit_relevance
210	express.score_target_keys
211	express.score_target_credit_relevance
212	express.score_target_keys
213	express.score_target_credit_relevance
214	express.score_target_keys
215	express.score_target_credit_relevance
216	express.score_target_keys
217	express.score_target_credit_relevance
218	express.score_target_keys
219	express.score_target_credit_relevance
220	express.score_target_keys
221	express.rule_observation_keys
\.


--
-- Data for Name: admin_rule; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) FROM stdin;
14	Score - Rules	\N	f	t	1	1
15	Score ? Rule	\N	f	t	2	5
16	Score + Rule	\N	f	t	3	2
20	Liquid Pledge	\N	t	f	4	2
21	Anual inferred Income and 	\N	f	f	5	1
22	Inferred Income	\N	t	f	5	1
24	Economic Sector	\N	t	f	6	1
25	Inferred Income	\N	t	f	7	5
26	Economic Sector	\N	t	f	8	5
27	ESG	\N	t	f	9	5
28	Liquid Pledge	\N	t	f	10	5
29	ESG	\N	t	f	11	2
30	Monex Profitability	\N	t	f	12	2
\.


--
-- Data for Name: admin_score; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_score (id, min, max, name, router, score, cme) FROM stdin;
1	0	20	\N	express	1	0
2	20	40	\N	express	2	0
3	40	55	\N	express	3	0.4
6	85	100	\N	express	6	1
5	70	85	\N	express	5	0.8
4	55	70	\N	express	4	0.6
\.


--
-- Data for Name: admin_score_option; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_score_option (id, min, max, value, ratio, rule_id) FROM stdin;
\.


--
-- Data for Name: admin_score_rule; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) FROM stdin;
4	Score Quantitative	\N	73	2	f	t	f	t
5	Score Qualitative	\N	74	2	f	t	f	t
6	Score Behaviour	\N	75	6	f	t	f	t
7	Score Quantitative	\N	188	1.5	t	f	f	t
8	Score Qualitative	\N	187	1.5	t	f	f	t
9	Score Behaviour	\N	189	7	t	f	f	t
\.


--
-- Data for Name: admin_status; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_status (id, status, weight) FROM stdin;
4	KO	0
3	OK	0
1	-	10
2	+	1
5	?	6
6	=	0
7	UPDATED	0
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.alembic_version (version_num) FROM stdin;
981931583a76
\.


--
-- Data for Name: creditapplication; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.creditapplication (id, id_external, is_client, router, n_employees, operation_antiquity, economic_sector, product_requested, rate, term_months, payment_method_equity, payment_method_interest, credit_destiny, requested_amount, regional, business_group, statements_date, currency, insert_date, update_date, rule_id, rule_info, rule_history, score_id, score, score_history, business_profile, aggrupation_history, risk_level, line_factor, line_granted, action_id, action_info, "limit", max_debt_service, manual_action_id, manual_action_info, application_date, line_text, recommendation) FROM stdin;
\.


--
-- Data for Name: factoring_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.factoring_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, credit_balance_active_bureau, paydex_12, deliquency_score, cessation_score, viability_score, wallet_comparison, company_profile, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, monex_payment_experience, actual_delay, max_delays_12m, days_delay, amount_delay, legal_events, data_intensity, invoices, line_max_calculation, score_quantitative, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, score_paydex, score_deliquency, score_cessation, score_viability, score_comparisson, score_company, payment_behaviour, score_payment_behaviour, score_days_delay, score_legal_events, score_data_intensity, score_days_delays, business_profile, exec_time) FROM stdin;
\.


--
-- Data for Name: leasing_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.leasing_indicator (id, naira_id, anual_sales, net_utility_ltm, equity_last_3_years, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, free_cashflow, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, shareholder_experience, business_stability, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, sum_wallet_more_31, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, line_product, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_shareholder_experience, score_business_stability, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, score_sum_wallet_more_31, solvency, score_solvency, business_profile, exec_time) FROM stdin;
\.


--
-- Data for Name: pyme_express_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.pyme_express_indicator (id, naira_id, business_profile, line_granted, exec_time, requested_amount, anual_inferred_income, sum_active_balance, operation_antiquity, monex_payment_experience, bureau_actual_behaviour, max_actual_delay_amount, bureau_historic_behaviour, max_historic_delay_amount, credit_antiquity, observation_key, prevention_key, esg, liquid_pledge, is_client, profitability_monex, economic_sector, line_max_historic, score_leverage, score_operation_antiquity, score_monex_payment_experience, score_bureau_actual_behaviour, score_payment_actual_bureau_behaviour, score_bureau_historic_behaviour, score_payment_historic_bureau_behaviour, score_credit_antiquity, score_credit_relevance, score_observation_prevention_keys, rule_anual_inferred_income, rule_economic_sector, rule_esg, rule_liquid_pledge, rule_profitability_monex, min_values, score_payment_actual_bureau_behaviour_final, score_payment_historic_bureau_behaviour_final, leverage, score_target_credit_relevance, score_target_keys, saldos_impago, var_deuda, creditos_activos_aval, saldo_vencido_activas_aval, saldo_vencido_aval, deuda_actual_aval, comportamientos_acreditado, comportamientos_aval, claves_acreditado, claves_aval, creditos_activos_acreditado, saldo_vencido_activas_acreditado, saldo_vencido_acreditado, score_buro_aval, score_buro_acreditado, line_max_product, line_max_product_factor, line_max_historic_factor, anual_inferred_income_factor, line_max_historic_value, anual_inferred_income_value, arr_periodo, arr_saldo, "arr_saldoVencido1_29", "arr_saldoVencido30_59", "arr_saldoVencido60_89", "arr_saldoVencidoA90", line_max_actual, rule_observation_keys, rule_antiquity, rule_actual_delay, rule_historic_delay, recommendation, score_qualitative, score_quantitative, score_behaviour) FROM stdin;
\.


--
-- Data for Name: pyme_traditional_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) FROM stdin;
\.


--
-- Data for Name: reporting_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.role (id, name, description) FROM stdin;
1	admin	admin
2	gestor	gestor
\.


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.role_user (user_id, role_id) FROM stdin;
1	1
2	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, name, "user", email, password, active, authenticated, last_action) FROM stdin;
2	gestor	gestor	gestor@naira.com	gestor	t	f	\N
1	admin	admin	admin@naira.com	$2b$12$jWzdOyahOEftUcbZrsCP4./pb2i8yNWjXQhFKPaGncrKLgHEz74X6	t	f	2023-08-18 05:12:33.200471
\.


--
-- Name: admin_aggrupation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_aggrupation_id_seq', 9, true);


--
-- Name: admin_aggrupation_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_aggrupation_option_id_seq', 35, true);


--
-- Name: admin_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_condition_id_seq', 73, true);


--
-- Name: admin_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_config_id_seq', 5, true);


--
-- Name: admin_decision_matrix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_decision_matrix_id_seq', 7, true);


--
-- Name: admin_discretization_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_discretization_condition_id_seq', 217, true);


--
-- Name: admin_discretization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_discretization_id_seq', 32, true);


--
-- Name: admin_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_field_id_seq', 221, true);


--
-- Name: admin_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_rule_id_seq', 31, true);


--
-- Name: admin_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_score_id_seq', 6, true);


--
-- Name: admin_score_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_score_option_id_seq', 28, true);


--
-- Name: admin_score_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_score_rule_id_seq', 9, true);


--
-- Name: admin_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_status_id_seq', 7, true);


--
-- Name: creditapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.creditapplication_id_seq', 353, true);


--
-- Name: factoring_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.factoring_indicator_id_seq', 1, false);


--
-- Name: leasing_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.leasing_indicator_id_seq', 1, false);


--
-- Name: pyme_express_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pyme_express_indicator_id_seq', 344, true);


--
-- Name: pyme_traditional_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pyme_traditional_indicator_id_seq', 1, false);


--
-- Name: reporting_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reporting_indicator_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: admin_aggrupation_option admin_aggrupation_option_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_aggrupation_option
    ADD CONSTRAINT admin_aggrupation_option_pkey PRIMARY KEY (id);


--
-- Name: admin_aggrupation admin_aggrupation_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_aggrupation
    ADD CONSTRAINT admin_aggrupation_pkey PRIMARY KEY (id);


--
-- Name: admin_condition admin_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_condition
    ADD CONSTRAINT admin_condition_pkey PRIMARY KEY (id);


--
-- Name: admin_config admin_config_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_config
    ADD CONSTRAINT admin_config_pkey PRIMARY KEY (id);


--
-- Name: admin_decision_matrix admin_decision_matrix_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_decision_matrix
    ADD CONSTRAINT admin_decision_matrix_pkey PRIMARY KEY (id);


--
-- Name: admin_discretization_condition admin_discretization_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization_condition
    ADD CONSTRAINT admin_discretization_condition_pkey PRIMARY KEY (id);


--
-- Name: admin_discretization admin_discretization_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization
    ADD CONSTRAINT admin_discretization_pkey PRIMARY KEY (id);


--
-- Name: admin_field admin_field_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_field
    ADD CONSTRAINT admin_field_pkey PRIMARY KEY (id);


--
-- Name: admin_rule admin_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_rule
    ADD CONSTRAINT admin_rule_pkey PRIMARY KEY (id);


--
-- Name: admin_score_option admin_score_option_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_score_option
    ADD CONSTRAINT admin_score_option_pkey PRIMARY KEY (id);


--
-- Name: admin_score admin_score_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_score
    ADD CONSTRAINT admin_score_pkey PRIMARY KEY (id);


--
-- Name: admin_score_rule admin_score_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_score_rule
    ADD CONSTRAINT admin_score_rule_pkey PRIMARY KEY (id);


--
-- Name: admin_status admin_status_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_status
    ADD CONSTRAINT admin_status_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: creditapplication creditapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.creditapplication
    ADD CONSTRAINT creditapplication_pkey PRIMARY KEY (id);


--
-- Name: factoring_indicator factoring_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.factoring_indicator
    ADD CONSTRAINT factoring_indicator_pkey PRIMARY KEY (id);


--
-- Name: leasing_indicator leasing_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.leasing_indicator
    ADD CONSTRAINT leasing_indicator_pkey PRIMARY KEY (id);


--
-- Name: pyme_express_indicator pyme_express_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pyme_express_indicator
    ADD CONSTRAINT pyme_express_indicator_pkey PRIMARY KEY (id);


--
-- Name: pyme_traditional_indicator pyme_traditional_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pyme_traditional_indicator
    ADD CONSTRAINT pyme_traditional_indicator_pkey PRIMARY KEY (id);


--
-- Name: reporting_indicator reporting_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reporting_indicator
    ADD CONSTRAINT reporting_indicator_pkey PRIMARY KEY (id);


--
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: admin_aggrupation admin_aggrupation_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_aggrupation
    ADD CONSTRAINT admin_aggrupation_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.admin_field(id);


--
-- Name: admin_aggrupation_option admin_aggrupation_option_aggrupation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_aggrupation_option
    ADD CONSTRAINT admin_aggrupation_option_aggrupation_id_fkey FOREIGN KEY (aggrupation_id) REFERENCES public.admin_aggrupation(id);


--
-- Name: admin_aggrupation_option admin_aggrupation_option_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_aggrupation_option
    ADD CONSTRAINT admin_aggrupation_option_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.admin_field(id);


--
-- Name: admin_condition admin_condition_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_condition
    ADD CONSTRAINT admin_condition_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.admin_field(id);


--
-- Name: admin_condition admin_condition_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_condition
    ADD CONSTRAINT admin_condition_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES public.admin_rule(id);


--
-- Name: admin_decision_matrix admin_decision_matrix_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_decision_matrix
    ADD CONSTRAINT admin_decision_matrix_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.admin_status(id);


--
-- Name: admin_decision_matrix admin_decision_matrix_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_decision_matrix
    ADD CONSTRAINT admin_decision_matrix_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES public.admin_status(id);


--
-- Name: admin_discretization_condition admin_discretization_condition_discretization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization_condition
    ADD CONSTRAINT admin_discretization_condition_discretization_id_fkey FOREIGN KEY (discretization_id) REFERENCES public.admin_discretization(id);


--
-- Name: admin_discretization_condition admin_discretization_condition_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization_condition
    ADD CONSTRAINT admin_discretization_condition_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.admin_field(id);


--
-- Name: admin_discretization admin_discretization_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization
    ADD CONSTRAINT admin_discretization_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.admin_field(id);


--
-- Name: admin_discretization admin_discretization_target_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization
    ADD CONSTRAINT admin_discretization_target_id_fkey FOREIGN KEY (target_id) REFERENCES public.admin_field(id);


--
-- Name: admin_rule admin_rule_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_rule
    ADD CONSTRAINT admin_rule_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.admin_status(id);


--
-- Name: admin_score_option admin_score_option_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_score_option
    ADD CONSTRAINT admin_score_option_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES public.admin_score_rule(id);


--
-- Name: admin_score_rule admin_score_rule_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_score_rule
    ADD CONSTRAINT admin_score_rule_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.admin_field(id);


--
-- Name: creditapplication creditapplication_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.creditapplication
    ADD CONSTRAINT creditapplication_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.admin_status(id);


--
-- Name: creditapplication creditapplication_manual_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.creditapplication
    ADD CONSTRAINT creditapplication_manual_action_id_fkey FOREIGN KEY (manual_action_id) REFERENCES public.admin_status(id);


--
-- Name: creditapplication creditapplication_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.creditapplication
    ADD CONSTRAINT creditapplication_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES public.admin_status(id);


--
-- Name: creditapplication creditapplication_score_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.creditapplication
    ADD CONSTRAINT creditapplication_score_id_fkey FOREIGN KEY (score_id) REFERENCES public.admin_score(id);


--
-- Name: factoring_indicator factoring_indicator_naira_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.factoring_indicator
    ADD CONSTRAINT factoring_indicator_naira_id_fkey FOREIGN KEY (naira_id) REFERENCES public.creditapplication(id);


--
-- Name: leasing_indicator leasing_indicator_naira_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.leasing_indicator
    ADD CONSTRAINT leasing_indicator_naira_id_fkey FOREIGN KEY (naira_id) REFERENCES public.creditapplication(id);


--
-- Name: pyme_express_indicator pyme_express_indicator_naira_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pyme_express_indicator
    ADD CONSTRAINT pyme_express_indicator_naira_id_fkey FOREIGN KEY (naira_id) REFERENCES public.creditapplication(id);


--
-- Name: pyme_traditional_indicator pyme_traditional_indicator_naira_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pyme_traditional_indicator
    ADD CONSTRAINT pyme_traditional_indicator_naira_id_fkey FOREIGN KEY (naira_id) REFERENCES public.creditapplication(id);


--
-- Name: reporting_indicator reporting_indicator_naira_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reporting_indicator
    ADD CONSTRAINT reporting_indicator_naira_id_fkey FOREIGN KEY (naira_id) REFERENCES public.creditapplication(id);


--
-- Name: role_user role_user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: role_user role_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

