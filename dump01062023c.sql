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
    application_date character varying NOT NULL
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
    requested_amount double precision,
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
    "rule_bureau_actual_behaviour_KO" character varying,
    rule_bureau_actual_behaviour_text character varying,
    "rule_bureau_historic_behaviour_KO" character varying,
    rule_bureau_historic_behaviour_text character varying,
    "rule_keys_KO" character varying,
    score_qualitative integer,
    score_quantitative integer,
    score_behaviour integer,
    leverage double precision,
    score_target_credit_relevance double precision,
    score_target_keys double precision
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

INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (5, 'Score Qualitative', NULL, 'tradicional', 74);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (4, 'Score Quantitative', NULL, 'tradicional', 73);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (6, 'Score Behaviour', NULL, 'tradicional', 75);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (7, 'Score Quantitative', NULL, 'express', 188);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (8, 'Score Qualitative', NULL, 'express', 187);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (9, 'Score Behaviour', NULL, 'express', 189);


--
-- Data for Name: admin_aggrupation_option; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (12, 10, 56, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (13, 10, 58, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (14, 10, 60, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (15, 20, 62, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (16, 10, 64, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (17, 10, 65, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (18, 10, 68, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (19, 10, 70, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (20, 10, 72, 4);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (21, 40, 90, 5);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (22, 30, 80, 5);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (23, 30, 82, 5);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (24, 10, 84, 6);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (26, 30, 86, 6);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (27, 30, 88, 6);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (25, 30, 100, 6);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (28, 100, 165, 7);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (29, 100, 166, 8);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (30, 15, 167, 9);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (31, 15, 170, 9);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (32, 15, 173, 9);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (33, 15, 174, 9);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (34, 15, 191, 9);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (35, 25, 192, 9);


--
-- Data for Name: admin_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (23, 89, NULL, NULL, '{-}', false, 1, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (25, 91, NULL, NULL, '{-}', false, 3, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (26, 92, NULL, NULL, '{-}', false, 4, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (27, 93, NULL, NULL, '{-}', false, 5, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (28, 94, NULL, NULL, '{-}', false, 6, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (29, 95, NULL, NULL, '{-}', false, 7, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (30, 96, NULL, NULL, '{-}', false, 8, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (31, 97, NULL, NULL, '{-}', false, 9, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (32, 98, NULL, NULL, '{-}', false, 10, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (33, 89, NULL, NULL, '{?}', false, 1, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (35, 91, NULL, NULL, '{?}', false, 3, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (36, 92, NULL, NULL, '{?}', false, 4, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (37, 94, NULL, NULL, '{?}', false, 5, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (38, 95, NULL, NULL, '{?}', false, 6, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (39, 96, NULL, NULL, '{?}', false, 7, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (40, 97, NULL, NULL, '{?}', false, 8, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (41, 98, NULL, NULL, '{?}', false, 9, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (42, 93, NULL, NULL, '{?}', false, 10, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (43, 89, NULL, NULL, '{+}', false, 1, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (45, 91, NULL, NULL, '{+}', false, 3, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (46, 92, NULL, NULL, '{+}', false, 4, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (47, 93, NULL, NULL, '{+}', false, 5, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (48, 94, NULL, NULL, '{+}', false, 6, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (49, 95, NULL, NULL, '{+}', false, 7, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (50, 96, NULL, NULL, '{+}', false, 8, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (51, 97, NULL, NULL, '{+}', false, 9, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (52, 98, NULL, NULL, '{+}', false, 10, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (24, 101, NULL, NULL, '{-}', false, 2, 14);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (34, 101, NULL, NULL, '{?}', false, 2, 15);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (44, 101, NULL, NULL, '{+}', false, 2, 16);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (55, 182, NULL, NULL, '{-}', false, 1, 17);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (56, 184, NULL, NULL, '{-}', false, 1, 18);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (57, 186, NULL, NULL, '{-}', false, 1, 19);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (58, 180, NULL, NULL, '{+}', false, 1, 20);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (59, NULL, NULL, NULL, '{-}', false, NULL, 21);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (60, 177, NULL, NULL, '{-}', false, 1, 22);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (61, 178, NULL, NULL, '{-}', false, 2, 22);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (62, 177, NULL, NULL, '{?}', false, 1, 23);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (63, 178, NULL, NULL, '{?}', false, 2, 23);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (64, 179, NULL, NULL, '{?}', false, 3, 23);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (65, 180, NULL, NULL, '{?}', false, 4, 23);


--
-- Data for Name: admin_config; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_config (id, variable, key, value) VALUES (1, 'general', 'aggregation_provider', 'UNNAX');
INSERT INTO public.admin_config (id, variable, key, value) VALUES (2, 'general', 'ACCEPTED', 'OK');
INSERT INTO public.admin_config (id, variable, key, value) VALUES (3, 'general', 'REJECTED', 'KO');
INSERT INTO public.admin_config (id, variable, key, value) VALUES (4, 'general', 'REVIEW', 'Manual Review');
INSERT INTO public.admin_config (id, variable, key, value) VALUES (5, 'general', 'MAX_INACTIVE_SECS', '120');


--
-- Data for Name: admin_decision_matrix; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_decision_matrix (id, rule_id, scores, action_id, action_info) VALUES (4, 5, '{1,2}', 4, 'Score rejection [1,2]');
INSERT INTO public.admin_decision_matrix (id, rule_id, scores, action_id, action_info) VALUES (5, 1, '{1,2,3,4,5,6}', 4, 'Rule rejection');
INSERT INTO public.admin_decision_matrix (id, rule_id, scores, action_id, action_info) VALUES (2, 5, '{3,4,5,6}', 5, 'Needs Manual Review');
INSERT INTO public.admin_decision_matrix (id, rule_id, scores, action_id, action_info) VALUES (3, 2, '{1,2}', 4, 'Score rejection [1,2]');
INSERT INTO public.admin_decision_matrix (id, rule_id, scores, action_id, action_info) VALUES (6, 6, '{1,2}', 4, 'Score rejection [1,2]');
INSERT INTO public.admin_decision_matrix (id, rule_id, scores, action_id, action_info) VALUES (7, 6, '{3,4,5,6}', 3, 'Accept');
INSERT INTO public.admin_decision_matrix (id, rule_id, scores, action_id, action_info) VALUES (1, 2, '{3,4,5,6}', 3, 'Accept');


--
-- Data for Name: admin_discretization; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (13, 'Score Sales Evolution', NULL, 55, 56, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (14, 'Score Average ROE', NULL, 57, 58, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (15, 'Score Average Net Margins', NULL, 59, 60, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (16, 'Score Financial Debt / EBITDA', NULL, 61, 62, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (17, 'Score Interest Coverage', NULL, 63, 64, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (18, 'Score Cash Flow', NULL, 65, 66, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (19, 'Score Adjusted Working Equity', NULL, 67, 68, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (20, 'Score Cash Cycle', NULL, 69, 70, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (21, 'Score Asset Rotation', NULL, 71, 72, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (22, 'Score Operation Antiquity', NULL, 23, 90, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (23, 'Score Shareholder Experience', NULL, 79, 80, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (24, 'Score Business Stability', NULL, 81, 82, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (25, 'Score Monex Payment Experience', NULL, 83, 84, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (26, 'Score Max Delays 12m', NULL, 85, 86, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (27, 'Score Past Due Average Days', NULL, 87, 88, false, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (28, 'Score_leverage', NULL, 146, 165, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (29, 'Score Monex Payment Experience', NULL, 151, 167, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (30, 'Score Operation Antiquity', NULL, 150, 166, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (31, 'Score Credit Relevance', NULL, 175, 191, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (32, 'Score Keys', NULL, 176, 192, true, false, false);


--
-- Data for Name: admin_discretization_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (78, NULL, 1, NULL, NULL, '{}', true, 0, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (79, NULL, 2, -0.15, NULL, '{}', false, 0, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (80, NULL, 3, -0.15, -0.1, '{}', false, 2, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (81, NULL, 4, -0.1, 0, '{}', false, 4, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (82, NULL, 5, 0, 0.03, '{}', false, 6, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (83, NULL, 6, 0.03, 0.07, '{}', false, 8, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (84, NULL, 7, NULL, 0.07, '{}', false, 10, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (85, NULL, 1, NULL, NULL, '{}', true, 8, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (86, NULL, 2, -0.1, NULL, '{}', false, 0, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (87, NULL, 3, -0.1, -0.02, '{}', false, 2, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (88, NULL, 4, -0.02, 0.01, '{}', false, 4, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (89, NULL, 5, 0.01, 0.05, '{}', false, 6, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (90, NULL, 6, 0.05, 0.07, '{}', false, 8, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (91, NULL, 7, NULL, 0.07, '{}', false, 10, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (92, NULL, 1, NULL, NULL, '{}', true, 8, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (93, NULL, 2, -0.1, NULL, '{}', false, 0, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (94, NULL, 3, -0.1, 0, '{}', false, 2, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (95, NULL, 4, 0, 0.01, '{}', false, 4, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (22, NULL, 1, NULL, NULL, '{1}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (23, NULL, 2, NULL, NULL, '{2}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (24, NULL, 3, NULL, NULL, '{3}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (25, NULL, 4, NULL, NULL, '{4}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (26, NULL, 5, NULL, NULL, '{5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (27, NULL, 6, NULL, NULL, '{6}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (96, NULL, 5, 0.01, 0.05, '{}', false, 6, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (97, NULL, 6, 0.05, 0.07, '{}', false, 8, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (98, NULL, 7, NULL, 0.07, '{}', false, 10, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (99, NULL, 1, NULL, NULL, '{}', true, 8, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (100, NULL, 2, 1.5, NULL, '{}', false, 10, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (101, NULL, 3, 1.5, 2, '{}', false, 8, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (102, NULL, 4, 2, 2.5, '{}', false, 6, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (103, NULL, 5, 2.5, 3, '{}', false, 4, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (104, NULL, 6, 3, 4, '{}', false, 2, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (34, NULL, 1, NULL, 0.5, '{}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (46, NULL, 1, NULL, NULL, '{"MOP 1"}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (47, NULL, 2, NULL, NULL, '{"MOP 2"}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (69, NULL, 1, NULL, NULL, '{"No presenta clave"}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (70, NULL, 2, NULL, NULL, '{1}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (40, NULL, 1, NULL, 0.5, '{}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (41, NULL, 2, NULL, NULL, '{0.5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (42, NULL, 3, 0.5, 0.8, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (44, NULL, 5, 1, 1.5, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (55, NULL, 1, NULL, 0.01, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (56, NULL, 2, NULL, NULL, '{0.01}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (57, NULL, 3, 0.01, 0.02, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (2, NULL, 2, 0.5, 1, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (3, NULL, 3, 1, 2, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (4, NULL, 4, 2, 2.5, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (5, NULL, 5, 2.5, 3, '{}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (74, NULL, 1, 2, 3, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (75, NULL, 2, 3, 5, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (76, NULL, 3, 5, 10, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (77, NULL, 4, 10, NULL, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (35, NULL, 2, NULL, NULL, '{0.5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (36, NULL, 3, 0.5, 1, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (37, NULL, 4, 1, 2, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (38, NULL, 5, 2, 3, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (39, NULL, 6, 3, NULL, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (48, NULL, 3, NULL, NULL, '{"Sin información"}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (49, NULL, 4, NULL, NULL, '{"MOP 3","Mayor o igual a MOP 4"}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (62, NULL, 1, NULL, 0.6, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (63, NULL, 2, NULL, NULL, '{0.6}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (64, NULL, 3, 0.6, 1, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (65, NULL, 4, 1, 1.5, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (66, NULL, 5, 1.5, 2, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (67, NULL, 6, NULL, NULL, '{2}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (68, NULL, 7, 2, NULL, '{}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (58, NULL, 4, 0.02, 0.03, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (59, NULL, 5, 0.03, 0.04, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (71, NULL, 3, NULL, NULL, '{2}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (72, NULL, 4, NULL, NULL, '{3}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (73, NULL, 5, NULL, NULL, '{"Sin historial"}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (50, NULL, 1, NULL, NULL, '{"MOP 1"}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (51, NULL, 2, NULL, NULL, '{"MOP 2"}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (52, NULL, 3, NULL, NULL, '{"MOP 3"}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (53, NULL, 4, NULL, NULL, '{"Sin información"}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (54, NULL, 5, NULL, NULL, '{"Mayor o igual a MOP 4"}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (28, NULL, 1, NULL, NULL, '{1}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (29, NULL, 2, NULL, NULL, '{2}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (30, NULL, 3, NULL, NULL, '{3,8}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (31, NULL, 4, NULL, NULL, '{4}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (32, NULL, 5, NULL, NULL, '{5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (33, NULL, 6, NULL, NULL, '{6,7}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (105, NULL, 7, NULL, 4, '{}', false, 0, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (106, NULL, 1, NULL, NULL, '{}', true, 8, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (107, NULL, 2, 1, NULL, '{}', false, 0, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (108, NULL, 3, 1, 1.5, '{}', false, 2, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (109, NULL, 4, 1.5, 2.5, '{}', false, 4, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (110, NULL, 5, 2.5, 4, '{}', false, 6, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (111, NULL, 6, 4, 7, '{}', false, 8, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (112, NULL, 7, NULL, 7, '{}', false, 10, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (113, NULL, 1, NULL, NULL, '{}', true, 8, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (114, NULL, 2, 0.06, NULL, '{}', false, 0, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (115, NULL, 3, 0.06, 0.09, '{}', false, 2, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (116, NULL, 4, 0.09, 0.13, '{}', false, 4, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (117, NULL, 5, 0.13, 0.23, '{}', false, 6, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (118, NULL, 6, 0.23, 0.35, '{}', false, 8, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (119, NULL, 7, 0.35, NULL, '{}', false, 10, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (120, NULL, 1, NULL, NULL, '{}', true, 8, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (121, NULL, 2, 0.5, NULL, '{}', false, 0, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (122, NULL, 3, 0.5, 0.8, '{}', false, 2, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (123, NULL, 4, 0.8, 1, '{}', false, 4, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (124, NULL, 5, 0.8, 1, '{}', false, 6, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (125, NULL, 6, 1, 2, '{}', false, 8, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (126, NULL, 7, 2, 3, '{}', false, 10, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (127, NULL, 1, NULL, NULL, '{}', true, 8, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (128, NULL, 2, 60, NULL, '{}', false, 10, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (129, NULL, 3, 60, 90, '{}', false, 8, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (130, NULL, 4, 90, 120, '{}', false, 6, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (131, NULL, 5, 120, 150, '{}', false, 4, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (132, NULL, 6, 150, 180, '{}', false, 2, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (133, NULL, 7, NULL, 180, '{}', false, 0, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (134, NULL, 1, NULL, NULL, '{}', true, 8, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (135, NULL, 2, 0.02, NULL, '{}', false, 0, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (136, NULL, 3, 0.02, 0.07, '{}', false, 2, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (137, NULL, 4, 0.07, 0.25, '{}', false, 4, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (138, NULL, 5, 0.25, 0.5, '{}', false, 6, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (139, NULL, 6, 0.5, 0.75, '{}', false, 8, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (140, NULL, 7, NULL, 0.75, '{}', false, 10, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (141, NULL, 1, NULL, NULL, '{"Sin información"}', true, 0, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (142, NULL, 2, 2, NULL, '{}', false, 0, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (143, NULL, 3, 2, 3, '{}', false, 4, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (144, NULL, 4, 3, 5, '{}', false, 6, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (145, NULL, 5, 5, 10, '{}', false, 8, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (146, NULL, 6, NULL, 10, '{}', false, 10, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (147, NULL, 1, NULL, NULL, '{6,8,7}', true, 0, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (148, NULL, 2, NULL, NULL, '{5}', false, 2, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (149, NULL, 3, NULL, NULL, '{4}', false, 4, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (150, NULL, 4, NULL, NULL, '{3}', false, 6, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (151, NULL, 5, NULL, NULL, '{2}', false, 8, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (152, NULL, 6, NULL, NULL, '{1}', false, 10, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (153, NULL, 1, NULL, NULL, '{6}', true, 0, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (154, NULL, 2, NULL, NULL, '{5}', false, 2, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (155, NULL, 3, NULL, NULL, '{4}', false, 4, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (156, NULL, 4, NULL, NULL, '{3}', false, 6, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (157, NULL, 5, NULL, NULL, '{2}', false, 8, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (158, NULL, 6, NULL, NULL, '{1}', false, 10, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (159, NULL, 1, NULL, NULL, '{6}', false, 0, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (160, NULL, 2, NULL, NULL, '{5}', false, 2, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (161, NULL, 3, NULL, NULL, '{4}', false, 4, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (162, NULL, 4, NULL, NULL, '{3,7,5}', false, 6, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (163, NULL, 5, NULL, NULL, '{2}', false, 8, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (164, NULL, 6, NULL, NULL, '{1}', false, 10, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (165, NULL, 1, NULL, NULL, '{"Sin información"}', true, 6, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (166, NULL, 2, NULL, NULL, '{0}', false, 10, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (167, NULL, 3, NULL, NULL, '{1}', false, 8, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (168, NULL, 4, NULL, NULL, '{2}', false, 6, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (169, NULL, 5, NULL, NULL, '{3}', false, 4, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (170, NULL, 6, NULL, NULL, '{4}', false, 2, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (171, NULL, 6, NULL, 4, '{}', false, 2, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (172, NULL, 1, NULL, NULL, '{"Sin información"}', true, 0, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (173, NULL, 2, NULL, NULL, '{0}', false, 10, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (174, NULL, 3, 1, 7, '{}', false, 8, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (175, NULL, 4, 7, 25, '{}', false, 6, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (176, NULL, 5, 25, 36, '{}', false, 4, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (177, NULL, 6, NULL, NULL, '{36}', false, 2, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (178, NULL, 7, NULL, 36, '{}', false, 2, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (14, NULL, 1, NULL, NULL, '{1}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (15, NULL, 2, NULL, NULL, '{2}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (16, NULL, 3, NULL, NULL, '{3}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (17, NULL, 4, NULL, NULL, '{4}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (18, NULL, 5, NULL, NULL, '{5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (19, NULL, 6, NULL, NULL, '{6}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (20, NULL, 7, NULL, NULL, '{7}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (21, NULL, 8, NULL, NULL, '{8}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (60, NULL, 6, 0.04, 0.05, '{}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (1, NULL, 1, NULL, 0.5, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (6, NULL, 6, 3, NULL, '{}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (61, NULL, 7, 0.05, NULL, '{}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (43, NULL, 4, 0.8, 1, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (45, NULL, 6, 1.5, NULL, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (179, NULL, 1, NULL, 0.5, '{}', false, 10, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (180, NULL, 2, 0.5, 1, '{}', false, 8, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (181, NULL, 3, 1, 2, '{}', false, 6, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (182, NULL, 4, 2, 2.5, '{}', false, 4, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (183, NULL, 5, 2.5, 3, '{}', false, 2, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (184, NULL, 6, 3, NULL, '{}', false, 0, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (185, NULL, 1, NULL, NULL, '{"Pago siempre puntual"}', false, 10, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (186, NULL, 2, NULL, NULL, '{"Un atraso poco relevante"}', false, 8, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (187, NULL, 3, NULL, NULL, '{"Un atraso relevante"}', false, 4, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (188, NULL, 4, NULL, NULL, '{"Más de un atraso relevante"}', false, 2, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (189, NULL, 5, NULL, NULL, '{"Cliente nuevo / Sin información"}', false, 8, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (190, NULL, 1, NULL, 2, '{}', false, 0, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (191, NULL, 2, 2, 2.5, '{}', false, 4, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (192, NULL, 3, 2.5, 3, '{}', false, 6, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (193, NULL, 4, 3, 10, '{}', false, 8, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (194, NULL, 5, 10, NULL, '{}', false, 10, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (195, NULL, 1, NULL, 0.6, '{}', false, 10, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (196, NULL, 2, NULL, NULL, '{0.6}', false, 10, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (197, NULL, 3, 0.6, 1, '{}', false, 8, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (198, NULL, 4, 1, 1.5, '{}', false, 6, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (199, NULL, 5, 1.5, 2, '{}', false, 4, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (200, NULL, 6, NULL, NULL, '{2}', false, 2, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (201, NULL, 7, 2, NULL, '{}', false, 0, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (202, NULL, 8, NULL, NULL, '{}', true, 0, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (203, NULL, 1, NULL, NULL, '{0}', false, 10, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (204, NULL, 2, NULL, NULL, '{1}', false, 8, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (205, NULL, 3, NULL, NULL, '{2}', false, 6, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (206, NULL, 4, NULL, NULL, '{3}', false, 0, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (208, NULL, 0, NULL, NULL, '{0}', false, 0, 28);


--
-- Data for Name: admin_field; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_field (id, field) VALUES (146, 'express.leverage');
INSERT INTO public.admin_field (id, field) VALUES (147, 'express.requested_amount');
INSERT INTO public.admin_field (id, field) VALUES (148, 'express.anual_inferred_income');
INSERT INTO public.admin_field (id, field) VALUES (149, 'express.sum_active_balance');
INSERT INTO public.admin_field (id, field) VALUES (150, 'express.operation_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (151, 'express.monex_payment_experience');
INSERT INTO public.admin_field (id, field) VALUES (152, 'express.bureau_actual_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (153, 'express.max_actual_delay_amount');
INSERT INTO public.admin_field (id, field) VALUES (22, 'n_employees');
INSERT INTO public.admin_field (id, field) VALUES (23, 'operation_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (154, 'express.bureau_historic_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (155, 'express.max_historic_delay_amount');
INSERT INTO public.admin_field (id, field) VALUES (156, 'express.credit_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (157, 'express.observation_key');
INSERT INTO public.admin_field (id, field) VALUES (158, 'express.prevention_key');
INSERT INTO public.admin_field (id, field) VALUES (159, 'express.esg');
INSERT INTO public.admin_field (id, field) VALUES (160, 'express.liquid_pledge');
INSERT INTO public.admin_field (id, field) VALUES (161, 'express.is_client');
INSERT INTO public.admin_field (id, field) VALUES (162, 'express.profitability_monex');
INSERT INTO public.admin_field (id, field) VALUES (163, 'express.economic_sector');
INSERT INTO public.admin_field (id, field) VALUES (164, 'express.line_max_historic');
INSERT INTO public.admin_field (id, field) VALUES (165, 'express.score_leverage');
INSERT INTO public.admin_field (id, field) VALUES (166, 'express.score_operation_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (167, 'express.score_monex_payment_experience');
INSERT INTO public.admin_field (id, field) VALUES (168, 'express.score_bureau_actual_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (169, 'express.score_payment_actual_bureau_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (170, 'express.score_payment_actual_bureau_behaviour_final');
INSERT INTO public.admin_field (id, field) VALUES (171, 'express.score_bureau_historic_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (172, 'express.score_payment_historic_bureau_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (173, 'express.score_payment_historic_bureau_behaviour_final');
INSERT INTO public.admin_field (id, field) VALUES (174, 'express.score_credit_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (175, 'express.score_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (176, 'express.score_observation_prevention_keys');
INSERT INTO public.admin_field (id, field) VALUES (177, 'express.rule_anual_inferred_income');
INSERT INTO public.admin_field (id, field) VALUES (178, 'express.rule_economic_sector');
INSERT INTO public.admin_field (id, field) VALUES (179, 'express.rule_esg');
INSERT INTO public.admin_field (id, field) VALUES (180, 'express.rule_liquid_pledge');
INSERT INTO public.admin_field (id, field) VALUES (55, 'traditional.sales_evolution');
INSERT INTO public.admin_field (id, field) VALUES (56, 'traditional.score_sales_evolution');
INSERT INTO public.admin_field (id, field) VALUES (57, 'traditional.avg_roe');
INSERT INTO public.admin_field (id, field) VALUES (58, 'traditional.score_avg_roe');
INSERT INTO public.admin_field (id, field) VALUES (59, 'traditional.avg_net_margins');
INSERT INTO public.admin_field (id, field) VALUES (60, 'traditional.score_avg_net_margins');
INSERT INTO public.admin_field (id, field) VALUES (61, 'traditional.financial_debt_ebitda');
INSERT INTO public.admin_field (id, field) VALUES (62, 'traditional.score_financial_debt_ebitda');
INSERT INTO public.admin_field (id, field) VALUES (63, 'traditional.interest_coverage');
INSERT INTO public.admin_field (id, field) VALUES (64, 'traditional.score_interest_coverage');
INSERT INTO public.admin_field (id, field) VALUES (65, 'traditional.cash_flow');
INSERT INTO public.admin_field (id, field) VALUES (66, 'traditional.score_cash_flow');
INSERT INTO public.admin_field (id, field) VALUES (67, 'traditional.adjusted_working_equity');
INSERT INTO public.admin_field (id, field) VALUES (68, 'traditional.score_adjusted_working_equity');
INSERT INTO public.admin_field (id, field) VALUES (69, 'traditional.cash_cycle');
INSERT INTO public.admin_field (id, field) VALUES (70, 'traditional.score_cash_cycle');
INSERT INTO public.admin_field (id, field) VALUES (71, 'traditional.assets_rotation');
INSERT INTO public.admin_field (id, field) VALUES (72, 'traditional.score_assets_rotation');
INSERT INTO public.admin_field (id, field) VALUES (73, 'traditional.score_quantitative');
INSERT INTO public.admin_field (id, field) VALUES (74, 'traditional.score_qualitative');
INSERT INTO public.admin_field (id, field) VALUES (75, 'traditional.score_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (79, 'traditional.shareholder_experience');
INSERT INTO public.admin_field (id, field) VALUES (80, 'traditional.score_shareholder_experience');
INSERT INTO public.admin_field (id, field) VALUES (81, 'traditional.business_stability');
INSERT INTO public.admin_field (id, field) VALUES (82, 'traditional.score_business_stability');
INSERT INTO public.admin_field (id, field) VALUES (83, 'traditional.monex_payment_experience');
INSERT INTO public.admin_field (id, field) VALUES (84, 'traditional.score_monex_payment_experience');
INSERT INTO public.admin_field (id, field) VALUES (85, 'traditional.max_delays_12m');
INSERT INTO public.admin_field (id, field) VALUES (86, 'traditional.score_max_delays_12m');
INSERT INTO public.admin_field (id, field) VALUES (87, 'traditional.past_due_avg_days');
INSERT INTO public.admin_field (id, field) VALUES (88, 'traditional.score_past_due_avg_days');
INSERT INTO public.admin_field (id, field) VALUES (89, 'traditional.score_payment_bureau_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (90, 'traditional.score_operation_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (91, 'traditional.score_economic_activity');
INSERT INTO public.admin_field (id, field) VALUES (92, 'traditional.score_profitability');
INSERT INTO public.admin_field (id, field) VALUES (93, 'traditional.score_government_dependencies');
INSERT INTO public.admin_field (id, field) VALUES (94, 'traditional.score_warranties');
INSERT INTO public.admin_field (id, field) VALUES (95, 'traditional.score_esg');
INSERT INTO public.admin_field (id, field) VALUES (96, 'traditional.score_property_solvency');
INSERT INTO public.admin_field (id, field) VALUES (97, 'traditional.score_exchange_op');
INSERT INTO public.admin_field (id, field) VALUES (98, 'traditional.score_factoring');
INSERT INTO public.admin_field (id, field) VALUES (99, 'traditional.credit_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (100, 'traditional.score_credit_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (101, 'traditional.score_credit_antiquity_rule');
INSERT INTO public.admin_field (id, field) VALUES (181, 'express.rule_profitability_monex');
INSERT INTO public.admin_field (id, field) VALUES (182, 'express.rule_bureau_actual_behaviour_KO');
INSERT INTO public.admin_field (id, field) VALUES (183, 'express.rule_bureau_actual_behaviour_text');
INSERT INTO public.admin_field (id, field) VALUES (184, 'express.rule_bureau_historic_behaviour_KO');
INSERT INTO public.admin_field (id, field) VALUES (185, 'express.rule_bureau_historic_behaviour_text');
INSERT INTO public.admin_field (id, field) VALUES (186, 'express.rule_keys_KO');
INSERT INTO public.admin_field (id, field) VALUES (187, 'express.score_qualitative');
INSERT INTO public.admin_field (id, field) VALUES (188, 'express.score_quantitative');
INSERT INTO public.admin_field (id, field) VALUES (189, 'express.score_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (190, 'express.min_values');
INSERT INTO public.admin_field (id, field) VALUES (191, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (192, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (193, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (194, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (195, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (196, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (197, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (198, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (199, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (200, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (201, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (202, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (203, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (204, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (205, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (206, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (207, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (208, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (209, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (210, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (211, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (212, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (213, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (214, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (215, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (216, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (217, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (218, 'express.score_target_keys');
INSERT INTO public.admin_field (id, field) VALUES (219, 'express.score_target_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (220, 'express.score_target_keys');


--
-- Data for Name: admin_rule; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (14, 'Score - Rules', NULL, false, true, 1, 1);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (15, 'Score ? Rule', NULL, false, true, 2, 5);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (16, 'Score + Rule', NULL, false, true, 3, 2);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (17, 'Bureau Actual behaviour KO', NULL, true, false, 1, 1);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (18, 'Bureau Historic Behaviour KO', NULL, true, false, 2, 1);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (19, 'Observation and Prevention KO', NULL, true, false, 3, 1);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (20, 'Liquid Pledge', NULL, true, false, 4, 2);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (21, 'Anual inferred Income and ', NULL, false, false, 5, 1);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (22, 'Inferred Income and economic sector -', NULL, true, false, 5, 1);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (23, 'Revision rules', NULL, true, false, 6, 5);


--
-- Data for Name: admin_score; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_score (id, min, max, name, router, score, cme) VALUES (1, 0, 20, NULL, 'express', 1, 0);
INSERT INTO public.admin_score (id, min, max, name, router, score, cme) VALUES (2, 20, 40, NULL, 'express', 2, 0);
INSERT INTO public.admin_score (id, min, max, name, router, score, cme) VALUES (3, 40, 55, NULL, 'express', 3, 0.4);
INSERT INTO public.admin_score (id, min, max, name, router, score, cme) VALUES (6, 85, 100, NULL, 'express', 6, 1);
INSERT INTO public.admin_score (id, min, max, name, router, score, cme) VALUES (5, 70, 85, NULL, 'express', 5, 0.8);
INSERT INTO public.admin_score (id, min, max, name, router, score, cme) VALUES (4, 55, 70, NULL, 'express', 4, 0.6);


--
-- Data for Name: admin_score_option; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: admin_score_rule; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (4, 'Score Quantitative', NULL, 73, 2, false, true, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (5, 'Score Qualitative', NULL, 74, 2, false, true, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (6, 'Score Behaviour', NULL, 75, 6, false, true, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (7, 'Score Quantitative', NULL, 188, 1.5, true, false, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (8, 'Score Qualitative', NULL, 187, 1.5, true, false, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (9, 'Score Behaviour', NULL, 189, 7, true, false, false, true);


--
-- Data for Name: admin_status; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_status (id, status, weight) VALUES (4, 'KO', 0);
INSERT INTO public.admin_status (id, status, weight) VALUES (3, 'OK', 0);
INSERT INTO public.admin_status (id, status, weight) VALUES (1, '-', 10);
INSERT INTO public.admin_status (id, status, weight) VALUES (2, '+', 1);
INSERT INTO public.admin_status (id, status, weight) VALUES (5, '?', 6);
INSERT INTO public.admin_status (id, status, weight) VALUES (6, '=', 0);
INSERT INTO public.admin_status (id, status, weight) VALUES (7, 'UPDATED', 0);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.alembic_version (version_num) VALUES ('c419bde92527');


--
-- Data for Name: creditapplication; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: factoring_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: leasing_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: pyme_express_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: pyme_traditional_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: reporting_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.role (id, name, description) VALUES (1, 'admin', 'admin');
INSERT INTO public.role (id, name, description) VALUES (2, 'gestor', 'gestor');


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.role_user (user_id, role_id) VALUES (1, 1);
INSERT INTO public.role_user (user_id, role_id) VALUES (2, 2);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.users (id, name, "user", email, password, active, authenticated, last_action) VALUES (2, 'gestor', 'gestor', 'gestor@naira.com', 'gestor', true, false, NULL);
INSERT INTO public.users (id, name, "user", email, password, active, authenticated, last_action) VALUES (1, 'admin', 'admin', 'admin@naira.com', '$2b$12$jWzdOyahOEftUcbZrsCP4./pb2i8yNWjXQhFKPaGncrKLgHEz74X6', true, false, '2023-05-16 19:51:45.816521');


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

SELECT pg_catalog.setval('public.admin_condition_id_seq', 65, true);


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

SELECT pg_catalog.setval('public.admin_discretization_condition_id_seq', 208, true);


--
-- Name: admin_discretization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_discretization_id_seq', 32, true);


--
-- Name: admin_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_field_id_seq', 220, true);


--
-- Name: admin_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_rule_id_seq', 23, true);


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

SELECT pg_catalog.setval('public.creditapplication_id_seq', 189, true);


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

SELECT pg_catalog.setval('public.pyme_express_indicator_id_seq', 98, true);


--
-- Name: pyme_traditional_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pyme_traditional_indicator_id_seq', 27, true);


--
-- Name: reporting_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reporting_indicator_id_seq', 72, true);


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

