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
    application_date character varying NOT NULL,
    id_external character varying NOT NULL,
    is_client boolean NOT NULL,
    router character varying NOT NULL,
    n_employees integer,
    operation_antiquity integer,
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
    manual_action_info character varying
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
    anual_sales double precision[],
    net_utility_ltm double precision[],
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
    warranty_type character varying,
    warranty_value double precision,
    endorsement_1 character varying,
    endorsement_2 character varying,
    endorsement_3 character varying,
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
    product_limit double precision,
    line_proposal_final character varying,
    leverage double precision,
    score_leverage double precision,
    score_quantitative double precision,
    score_operation_antiquity double precision,
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
    solvency double precision,
    score_solvency character varying,
    business_profile character varying,
    line_granted double precision,
    exec_time character varying
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
1	Score Qualitative	\N	express	15
2	Score Quantitative	\N	express	14
3	Score Behaviour	\N	express	16
5	Score Qualitative	\N	tradicional	74
4	Score Quantitative	\N	tradicional	73
6	Score Behaviour	\N	tradicional	75
\.


--
-- Data for Name: admin_aggrupation_option; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) FROM stdin;
4	100	21	2
5	10	30	3
6	20	45	3
7	20	35	3
8	20	37	3
9	10	39	3
10	10	41	3
11	10	43	3
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
1	100	17	1
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
10	50	\N	\N	{+}	f	1	9
11	46	\N	\N	{-}	f	1	10
12	46	\N	\N	{?}	f	1	11
13	48	\N	\N	{?}	f	2	11
14	49	\N	\N	{?}	f	3	11
15	50	\N	\N	{?}	f	4	11
54	47	\N	\N	{?}	f	5	11
16	49	\N	\N	{+}	f	1	12
17	47	\N	\N	{+}	f	2	12
53	48	\N	\N	{-}	f	2	10
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
1	Score Leverage	\N	20	21	t	f	f
2	Score operation Antiquity	\N	23	17	t	f	f
5	Monex Payment Experience	\N	29	30	t	f	f
6	Score Credit Antiquity Client	\N	33	31	t	f	f
7	Score Credit Antiquity Client	\N	33	32	t	f	f
8	Score Payment Bureau Behaviour	\N	34	35	t	f	f
9	Score Historic Behaviour	\N	36	37	t	f	f
10	Score Relevant Delays	\N	38	39	t	f	f
11	Score Credit Relevance	\N	40	41	t	f	f
12	Score Observation Keys	\N	42	43	t	f	f
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
\.


--
-- Data for Name: admin_discretization_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) FROM stdin;
1	\N	1	0.5	\N	{}	f	10	1
2	\N	2	0.5	1	{}	f	8	1
3	\N	3	1	2	{}	f	6	1
4	\N	4	2	2.5	{}	f	4	1
5	\N	5	2.5	3	{}	f	2	1
6	\N	6	\N	3	{}	f	0	1
74	\N	1	2	3	{}	f	4	2
78	\N	1	\N	\N	{}	t	0	13
79	\N	2	-0.15	\N	{}	f	0	13
80	\N	3	-0.15	-0.1	{}	f	2	13
81	\N	4	-0.1	0	{}	f	4	13
82	\N	5	0	0.03	{}	f	6	13
83	\N	6	0.03	0.07	{}	f	8	13
28	\N	1	\N	\N	{1}	f	10	5
29	\N	2	\N	\N	{2}	f	8	5
30	\N	3	\N	\N	{3,8}	f	6	5
31	\N	4	\N	\N	{4}	f	4	5
32	\N	5	\N	\N	{5}	f	2	5
33	\N	6	\N	\N	{6,7}	f	0	5
34	\N	1	0.5	\N	{}	f	0	6
35	\N	2	\N	\N	{0.5}	f	2	6
36	\N	3	0.5	1	{}	f	4	6
37	\N	4	1	2	{}	f	6	6
38	\N	5	2	3	{}	f	8	6
39	\N	6	\N	3	{}	f	10	6
40	\N	1	0.5	\N	{}	f	0	7
41	\N	2	\N	\N	{0.5}	f	2	7
42	\N	3	0.5	0.8	{}	f	4	7
43	\N	4	0.8	1	{}	f	6	7
44	\N	5	1	1.5	{}	f	8	7
45	\N	6	\N	1.5	{}	f	10	7
46	\N	1	\N	\N	{"MOP 1"}	f	10	8
47	\N	2	\N	\N	{"MOP 2"}	f	8	8
48	\N	3	\N	\N	{"Sin información"}	f	4	8
49	\N	4	\N	\N	{"MOP 3","Mayor o igual a MOP 4"}	f	0	8
50	\N	1	\N	\N	{"MOP 1"}	f	10	9
51	\N	2	\N	\N	{"MOP 2"}	f	8	9
52	\N	3	\N	\N	{"MOP 3"}	f	6	9
53	\N	4	\N	\N	{"Sin información"}	f	4	9
54	\N	5	\N	\N	{"Mayor o igual a MOP 4"}	f	0	9
55	\N	1	0.01	\N	{}	f	10	10
56	\N	2	\N	\N	{0.01}	f	10	10
57	\N	3	0.01	0.02	{}	f	8	10
58	\N	4	0.02	0.03	{}	f	6	10
59	\N	5	0.03	0.04	{}	f	4	10
60	\N	6	0.04	0.05	{}	f	2	10
61	\N	7	\N	0.05	{}	f	0	10
63	\N	2	\N	\N	{0.6}	f	10	11
65	\N	4	1	1.5	{}	f	6	11
66	\N	5	1.5	2	{}	f	4	11
67	\N	6	\N	\N	{2}	f	2	11
69	\N	1	\N	\N	{"No presenta clave"}	f	10	12
70	\N	2	\N	\N	{1}	f	8	12
71	\N	3	\N	\N	{2}	f	6	12
72	\N	4	\N	\N	{3}	f	0	12
73	\N	5	\N	\N	{"Sin historial"}	f	6	12
75	\N	2	3	5	{}	f	6	2
76	\N	3	5	10	{}	f	8	2
77	\N	4	\N	10	{}	f	10	2
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
62	\N	1	0.6	\N	{}	f	10	11
64	\N	3	0.6	1	{}	f	8	11
68	\N	7	\N	2	{}	f	2	11
96	\N	5	0.01	0.05	{}	f	6	15
97	\N	6	0.05	0.07	{}	f	8	15
98	\N	7	\N	0.07	{}	f	10	15
99	\N	1	\N	\N	{}	t	8	16
100	\N	2	1.5	\N	{}	f	10	16
101	\N	3	1.5	2	{}	f	8	16
102	\N	4	2	2.5	{}	f	6	16
103	\N	5	2.5	3	{}	f	4	16
104	\N	6	3	4	{}	f	2	16
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
\.


--
-- Data for Name: admin_field; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_field (id, field) FROM stdin;
14	express.score_quantitative
16	express.score_behaviour
15	express.score_qualitative
17	express.score_operation_antiquity
18	express.score_shareholder_experience
19	express.score_business_stability
20	express.leverage
21	express.score_leverage
22	n_employees
23	operation_antiquity
25	express.shareholder_experience
27	express.business_stability
29	express.monex_payment_experience
30	express.score_monex_payment_experience
31	express.score_antiquity_client
32	express.score_antiquity_no_client
33	express.credit_antiquity
34	express.payment_bureau_behaviour
35	express.score_payment_bureau_behaviour
36	express.historic_behaviour
37	express.score_historic_behaviour
38	express.relevant_delays
39	express.score_relevant_delays
40	express.line_proposal_max_bureau
41	express.score_credit_relevance
42	express.observation_keys
43	express.score_observation_keys
44	express.score_behaviour
45	express.score_credit_antiquity
46	express.score_anual_inferred_income
47	express.score_profitability
48	express.score_economic_sector
49	express.score_esg
51	express.score_sum_wallet_more_31
52	express.solvency
53	express.score_solvency
50	express.score_liquid_pledge
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
\.


--
-- Data for Name: admin_rule; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) FROM stdin;
14	Score - Rules	\N	f	t	1	1
15	Score ? Rule	\N	f	t	2	5
16	Score + Rule	\N	f	t	3	2
9	Score Liquid Pledge	\N	t	f	1	2
10	Scores Inferred Incomes, Score Economic Activity	\N	t	f	2	1
11	Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability	\N	t	f	3	5
12	Score Profitability, Score ESG	\N	t	f	4	2
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
1	Score Quantitative	\N	14	1.5	t	f	f	t
2	Score Qualitative	\N	15	1.5	t	f	f	t
3	Score Behaviour	\N	16	7	t	f	f	t
4	Score Quantitative	\N	73	2	f	t	f	t
5	Score Qualitative	\N	74	2	f	t	f	t
6	Score Behaviour	\N	75	6	f	t	f	t
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
ddbbfcf905f5
\.


--
-- Data for Name: creditapplication; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.creditapplication (id, application_date, id_external, is_client, router, n_employees, operation_antiquity, economic_sector, product_requested, rate, term_months, payment_method_equity, payment_method_interest, credit_destiny, requested_amount, regional, business_group, statements_date, currency, insert_date, update_date, rule_id, rule_info, rule_history, score_id, score, score_history, business_profile, aggrupation_history, risk_level, line_factor, line_granted, action_id, action_info, "limit", max_debt_service, manual_action_id, manual_action_info) FROM stdin;
1	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 21:02:25.081921	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_operation_antiquity\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_operation_antiquity\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_operation_antiquity\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
2	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 21:31:40.366396	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
3	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 21:35:49.046067	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
5	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 21:50:27.609471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 21:41:01.770315	\N	5	["[12] Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Anual Inferred income\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Profitability\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Economic Sector, ESG, Solvency, Score Solvency\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 13, \\"name\\": \\"Score Sum Wallet 31, Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_sum_wallet_more_31\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	84.6	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 13.799999999999999, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Bajo	0.9229999999999999	66456	5	Needs Manual Review	\N	\N	\N	\N
6	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 21:52:55.910211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 18:40:01.967702	\N	5	["[12] Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Anual Inferred income\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Profitability\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Economic Sector, ESG, Solvency, Score Solvency\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 13, \\"name\\": \\"Score Sum Wallet 31, Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_sum_wallet_more_31\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	84.6	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 13.799999999999999, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Bajo	90.44999999999999	3000000	5	Needs Manual Review	\N	\N	\N	\N
7	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 21:55:49.677108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 21:03:07.996165	\N	5	["[12] Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Anual Inferred income\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Profitability\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Economic Sector, ESG, Solvency, Score Solvency\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 13, \\"name\\": \\"Score Sum Wallet 31, Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_sum_wallet_more_31\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	73.80000000000001	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 3.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.35000000000001	3000000	5	Needs Manual Review	\N	\N	\N	\N
8	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 21:59:33.208139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 22:00:22.858176	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
10	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-08 22:00:40.378127	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
11	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 02:50:51.924302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 02:51:09.818779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 02:52:41.378266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 02:53:20.113016	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
15	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 02:53:37.345914	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
16	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 02:55:45.557703	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
17	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 02:56:00.240425	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	0.8055000000000001	40.275000000000006	5	Needs Manual Review	\N	\N	\N	\N
18	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 18:30:56.861851	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	485.25000000000006	24262.500000000004	5	Needs Manual Review	\N	\N	\N	\N
19	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 18:34:13.268229	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	485.25000000000006	24262.500000000004	5	Needs Manual Review	\N	\N	\N	\N
20	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 18:34:58.810531	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	31.5825	1579.125	5	Needs Manual Review	\N	\N	\N	\N
21	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 18:37:15.874254	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	72.82500000000002	3641.250000000001	5	Needs Manual Review	\N	\N	\N	\N
23	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 19:09:45.75779	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	72.82500000000002	3641.250000000001	5	Needs Manual Review	\N	\N	\N	\N
24	20220909	1	t	tradicional	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	\N	\N	\N	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-09 19:12:31.588029	\N	5	["[15] Score ? Rule ?", "[16] Score + Rule +"]	"[{\\"id\\": 14, \\"name\\": \\"Score - Rules\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 15, \\"name\\": \\"Score ? Rule\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": true}]}, {\\"id\\": 16, \\"name\\": \\"Score + Rule\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_payment_bureau_behaviour\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_credit_antiquity_rule\\", \\"value\\": null, \\"status\\": null}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_activity\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_government_dependencies\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_warranties\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_property_solvency\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_exchange_op\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_factoring\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	61.10000000000001	"[{\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 16.3, \\"conditions\\": []}, {\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 2.0, \\"use_field_value\\": true, \\"score\\": 12.4, \\"conditions\\": []}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 6.0, \\"use_field_value\\": true, \\"score\\": 32.400000000000006, \\"conditions\\": []}]"	?	"[{\\"id\\": 5, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 40}, {\\"field\\": \\"score_shareholder_experience\\", \\"percentage\\": 30}, {\\"field\\": \\"score_business_stability\\", \\"percentage\\": 30}]}, {\\"id\\": 4, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_sales_evolution\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_roe\\", \\"percentage\\": 10}, {\\"field\\": \\"score_avg_net_margins\\", \\"percentage\\": 10}, {\\"field\\": \\"score_financial_debt_ebitda\\", \\"percentage\\": 20}, {\\"field\\": \\"score_interest_coverage\\", \\"percentage\\": 10}, {\\"field\\": \\"cash_flow\\", \\"percentage\\": 10}, {\\"field\\": \\"score_adjusted_working_equity\\", \\"percentage\\": 10}, {\\"field\\": \\"score_cash_cycle\\", \\"percentage\\": 10}, {\\"field\\": \\"score_assets_rotation\\", \\"percentage\\": 10}]}, {\\"id\\": 6, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"tradicional\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_max_delays_12m\\", \\"percentage\\": 30}, {\\"field\\": \\"score_past_due_avg_days\\", \\"percentage\\": 30}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 30}]}]"	Medio bajo	72.82500000000002	3641.250000000001	5	Needs Manual Review	\N	\N	\N	\N
25	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 20:59:08.425808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 21:01:41.358528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 21:02:34.480851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 21:05:21.576294	\N	5	["[12] Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Anual Inferred income\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Profitability\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Economic Sector, ESG, Solvency, Score Solvency\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 13, \\"name\\": \\"Score Sum Wallet 31, Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_sum_wallet_more_31\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	73.80000000000001	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 3.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.35000000000001	3000000	5	Needs Manual Review	\N	\N	\N	\N
30	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 21:07:14.423014	\N	5	["[12] Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Anual Inferred income\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Profitability\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Economic Sector, ESG, Solvency, Score Solvency\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 13, \\"name\\": \\"Score Sum Wallet 31, Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_sum_wallet_more_31\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	73.80000000000001	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 3.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.35000000000001	3000000	5	Needs Manual Review	\N	\N	\N	\N
31	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 21:10:11.087714	\N	5	["[12] Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Anual Inferred income\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Profitability\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Economic Sector, ESG, Solvency, Score Solvency\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 13, \\"name\\": \\"Score Sum Wallet 31, Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_sum_wallet_more_31\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	73.80000000000001	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 3.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.35000000000001	3000000	5	Needs Manual Review	\N	\N	\N	\N
32	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 21:12:05.129542	\N	5	["[12] Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency ?", "[13] Score Sum Wallet 31, Liquid Pledge +"]	"[{\\"id\\": 9, \\"name\\": \\"Score Anual Inferred income\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Profitability\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Economic Sector, ESG, Solvency, Score Solvency\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"solvency\\", \\"value\\": 0.0, \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_solvency\\", \\"value\\": \\"+\\", \\"status\\": false}]}, {\\"id\\": 13, \\"name\\": \\"Score Sum Wallet 31, Liquid Pledge\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_sum_wallet_more_31\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": true}]}]"	1	10	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 3.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Muy alto	0	0	4	Score rejection [1,2]	\N	\N	\N	\N
33	20220909	1	t	express	1	8	Compraventa de artículos no clasificados en otra parte	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 21:30:23.722946	\N	2	["[9] Score Liquid Pledge +", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?", "[12] Score Profitability, Score ESG +"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": true}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	6	100	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 3.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	+	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Muy bajo	102	3000000	3	Accept	\N	\N	\N	\N
34	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-22 22:19:44.47259	\N	2	["[9] Score Liquid Pledge +", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": true}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	74.4	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 50.4, \\"conditions\\": []}]"	+	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.80000000000001	3000000	3	Accept	\N	\N	\N	\N
35	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 00:18:09.017804	\N	2	["[9] Score Liquid Pledge +", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": true}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	74.4	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 50.4, \\"conditions\\": []}]"	+	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.80000000000001	3000000	3	Accept	\N	\N	\N	\N
36	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 00:19:50.198145	\N	2	["[9] Score Liquid Pledge +", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": true}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	74.4	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 50.4, \\"conditions\\": []}]"	+	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.80000000000001	3000000	3	Accept	\N	\N	\N	\N
37	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 00:21:36.761382	\N	2	["[9] Score Liquid Pledge +", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": true}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	74.4	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 50.4, \\"conditions\\": []}]"	+	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.80000000000001	3000000	3	Accept	\N	\N	\N	\N
38	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 00:22:09.576969	\N	2	["[9] Score Liquid Pledge +", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": true}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	74.4	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 50.4, \\"conditions\\": []}]"	+	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.80000000000001	3000000	3	Accept	\N	\N	\N	\N
39	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 00:23:22.380385	\N	2	["[9] Score Liquid Pledge +", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": true}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	74.4	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 50.4, \\"conditions\\": []}]"	+	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.80000000000001	3000000	3	Accept	\N	\N	\N	\N
40	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 00:32:17.511613	\N	5	["[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	74.4	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 50.4, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.80000000000001	3000000	5	Needs Manual Review	\N	\N	\N	\N
41	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 00:44:03.66987	\N	1	["[10] Scores Inferred Incomes, Score Economic Activity -", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?", "[12] Score Profitability, Score ESG +"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": \\"-\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	70.80000000000001	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 0.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	-	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	80.10000000000001	3000000	4	Rule rejection	\N	\N	\N	\N
42	20220909	1	t	express	1	8	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 00:46:01.031239	\N	1	["[10] Scores Inferred Incomes, Score Economic Activity -", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?", "[12] Score Profitability, Score ESG +"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": \\"-\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	70.80000000000001	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 0.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	-	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	80.10000000000001	3000000	4	Rule rejection	\N	\N	\N	\N
43	20220909	1	t	express	1	8	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 03:10:30.718081	\N	1	["[10] Scores Inferred Incomes, Score Economic Activity -", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?", "[12] Score Profitability, Score ESG +"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": \\"-\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	70.80000000000001	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 0.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 58.800000000000004, \\"conditions\\": []}]"	-	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	80.10000000000001	3000000	4	Rule rejection	\N	\N	\N	\N
44	20220909	1	t	express	1	8	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 03:15:30.834995	\N	1	["[10] Scores Inferred Incomes, Score Economic Activity -", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?", "[12] Score Profitability, Score ESG +"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": \\"-\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	63.8	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 0.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 51.8, \\"conditions\\": []}]"	-	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	74.85	3000000	4	Rule rejection	\N	\N	\N	\N
45	20220909	1	t	express	1	8	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	1000000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 03:24:10.762296	\N	1	["[10] Scores Inferred Incomes, Score Economic Activity -", "[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?", "[12] Score Profitability, Score ESG +"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": \\"-\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"-\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": \\"+\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"+\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	4	65.19999999999999	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 0.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 53.199999999999996, \\"conditions\\": []}]"	-	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	75.89999999999999	3000000	4	Rule rejection	\N	\N	\N	\N
46	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	12	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-02-23 03:53:02.599946	\N	5	["[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	74.4	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 50.4, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	82.80000000000001	3000000	5	Needs Manual Review	\N	\N	\N	\N
48	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-03-01 20:01:28.707252	\N	5	["[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	73	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 49.0, \\"conditions\\": []}]"	-	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	81.75	3000000	7	UPDATED	\N	\N	\N	\N
49	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-03-16 23:55:20.261014	\N	5	["[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	73	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 49.0, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	81.75	3000000	5	Needs Manual Review	\N	\N	\N	\N
50	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-03-17 00:06:05.058277	\N	5	["[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	73	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 49.0, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	81.75	3000000	5	Needs Manual Review	\N	\N	\N	\N
51	20220909	1	t	express	1	6	Servicios de análisis de sistemas y procesamiento electrónico de datos	Crédito Simple	0.12	24	Capital	Interés	Pasivos	300000	Centro	SimplAI	25/01/2023	Peso mexicano	2023-03-17 00:07:04.364444	\N	5	["[11] Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability ?"]	"[{\\"id\\": 9, \\"name\\": \\"Score Liquid Pledge\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 10, \\"name\\": \\"Scores Inferred Incomes, Score Economic Activity\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"-\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": false}]}, {\\"id\\": 11, \\"name\\": \\"Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability\\", \\"status\\": \\"?\\", \\"match\\": true, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_anual_inferred_income\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_economic_sector\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_liquid_pledge\\", \\"value\\": \\"?\\", \\"status\\": true}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"?\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}, {\\"id\\": 12, \\"name\\": \\"Score Profitability, Score ESG\\", \\"status\\": null, \\"match\\": false, \\"conditions\\": [{\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_esg\\", \\"value\\": \\"=\\", \\"status\\": false}, {\\"min\\": null, \\"max\\": null, \\"allowed\\": [\\"+\\"], \\"allowed_na\\": false, \\"field\\": \\"score_profitability\\", \\"value\\": \\"=\\", \\"status\\": false}]}]"	5	73	"[{\\"id\\": 1, \\"name\\": \\"Score Quantitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 2, \\"name\\": \\"Score Qualitative\\", \\"weight\\": 1.5, \\"use_field_value\\": true, \\"score\\": 12.0, \\"conditions\\": []}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"weight\\": 7.0, \\"use_field_value\\": true, \\"score\\": 49.0, \\"conditions\\": []}]"	?	"[{\\"id\\": 1, \\"name\\": \\"Score Qualitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_operation_antiquity\\", \\"percentage\\": 100}]}, {\\"id\\": 2, \\"name\\": \\"Score Quantitative\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_leverage\\", \\"percentage\\": 100}]}, {\\"id\\": 3, \\"name\\": \\"Score Behaviour\\", \\"router\\": \\"express\\", \\"conditions\\": [{\\"field\\": \\"score_monex_payment_experience\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_antiquity\\", \\"percentage\\": 20}, {\\"field\\": \\"score_payment_bureau_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_historic_behaviour\\", \\"percentage\\": 20}, {\\"field\\": \\"score_relevant_delays\\", \\"percentage\\": 10}, {\\"field\\": \\"score_credit_relevance\\", \\"percentage\\": 10}, {\\"field\\": \\"score_observation_keys\\", \\"percentage\\": 10}]}]"	Medio bajo	81.75	3000000	5	Needs Manual Review	\N	\N	\N	\N
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

COPY public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) FROM stdin;
1	4	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	0.644	8	8	8	9.2	8	10	10	10	10	6	0.026258333333333335	0.029425	0.029425	6	0.6	10	8	8.4	?	No Deseable	=	+	=	=	0	+	\N	0	0:00:00
2	22	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	0.644	8	8	8	9.2	8	10	10	10	10	6	0.026258333333333335	0.029425	0.029425	6	0.6	10	8	8.4	?	No Deseable	=	+	=	=	0	+	\N	3000000	0:00:00.015000
3	27	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	2.5	0	\N	0	\N	0	10	10	10	0	0	0.026258333333333335	0.029425	0.029425	0	0.6	0	0	0	?	No Deseable	=	+	=	=	0	+	\N	0	0:00:00.016000
4	28	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	2.5	2	2	8	8	8	10	10	10	10	6	0.026258333333333335	0.029425	0.029425	6	0.6	10	8	8.4	?	No Deseable	=	+	=	=	0	+	\N	3000000	0:00:00.015000
5	29	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	2.5	2	2	8	8	8	10	10	10	10	6	0.026258333333333335	0.029425	0.029425	6	0.6	10	8	8.4	?	No Deseable	=	+	=	=	0	+	\N	3000000	0:00:00.015000
6	30	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	2.5	2	2	8	8	8	10	10	10	10	6	0.026258333333333335	0.029425	0.029425	6	0.6	10	8	8.4	?	No Deseable	=	+	=	=	0	+	\N	3000000	0:00:00
7	31	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	2.5	2	2	8	8	8	10	10	10	10	6	0.026258333333333335	0.029425	0.029425	6	0.6	10	8	8.4	?	No Deseable	=	+	=	=	0	+	\N	3000000	0:00:00.016000
8	32	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	2.5	2	2	8	8	8	10	10	10	10	6	0.026258333333333335	0.029425	0.029425	6	0.6	10	8	8.4	?	No Deseable	=	+	+	=	0	+	\N	0	0:00:00
9	33	{10,15,20,25,30}	{50000}	{120000,150000,30000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	6000000	800000	Líquida	0	aval1	aval2	aval3	2	0	7	3151	3531	MOP 1	MOP 3	20	20	123	0	1	Prácticas ESG	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	11500000	920000	72000	72000	buró	72000	0.08	0.6	3000000	buró	2.5	2	2	8	8	8	10	10	10	10	6	0.026258333333333335	0.029425	0.029425	6	0.6	10	8	8.4	?	No Deseable	=	+	+	=	0	+	\N	3000000	0:00:00.015000
10	34	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.6	10	0	7.2	?	No Deseable	=	=	+	=	0	+	\N	3000000	0:00:00
11	35	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.6	10	0	7.2	?	No Deseable	=	=	+	=	0	+	\N	3000000	0:00:00
12	36	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.6	10	0	7.2	?	No Deseable	=	=	+	=	0	+	\N	3000000	0:00:00.015000
13	37	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.6	10	0	7.2	?	No Deseable	=	=	+	=	0	+	\N	3000000	0:00:00.016000
14	38	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.6	10	0	7.2	?	No Deseable	=	=	+	=	0	+	\N	3000000	0:00:00
15	39	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.6	10	0	7.2	?	No Deseable	?	=	+	=	0	+	\N	3000000	0:00:00.016000
16	40	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.6	10	0	7.2	?	No Deseable	?	=	?	=	0	+	\N	3000000	0:00:00.015000
17	41	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	3000000	800000	0	0	aval1	aval2	aval3	2	0	7	3151	3151	MOP 1	MOP 3	0	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	5500000	440000	72000	72000	buró	72000	0.08	0.6	3000000	buró	5	0	0	8	8	8	10	10	10	10	6	0.026258333333333335	0.026258333333333335	0.026258333333333335	6	0.6	10	8	8.4	-	No Deseable	?	+	=	=	0	+	\N	3000000	0:00:00.016000
18	42	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	3000000	800000	0	0	aval1	aval2	aval3	2	0	7	3151	3151	MOP 1	MOP 3	0	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	5500000	440000	72000	72000	buró	72000	0.08	0.6	3000000	buró	5	0	0	8	8	8	10	10	10	10	6	0.026258333333333335	0.026258333333333335	0.026258333333333335	6	0.6	10	8	8.4	-	No Deseable	?	+	=	=	0	+	\N	3000000	0:00:00
19	43	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	3000000	800000	0	0	aval1	aval2	aval3	2	0	7	3151	3151	MOP 1	MOP 3	0	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	5500000	440000	72000	72000	buró	72000	0.08	0.6	3000000	buró	5	0	0	8	8	8	10	10	10	10	6	0.026258333333333335	0.026258333333333335	0.026258333333333335	6	0.6	10	8	8.4	-	No Deseable	?	+	=	=	0	+	\N	3000000	0:00:00.015000
20	44	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	3000000	800000	0	0	aval1	aval2	aval3	2	0	7	3151	3151	MOP 1	MOP 3	0	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	5500000	440000	72000	72000	buró	72000	0.08	0.6	3000000	buró	5	0	0	8	8	8	10	10	10	10	6	0.026258333333333335	0.026258333333333335	0.026258333333333335	6	8.333333333333334	0	8	7.3999999999999995	-	No Deseable	?	+	=	=	0	+	\N	3000000	0:00:00.016000
21	45	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	120000	250000	3000000	800000	0	0	aval1	aval2	aval3	2	0	7	3151	3151	MOP 1	MOP 3	0	20	123	0	1	Prácticas ESG	No	0	0	0	0	0	0	0	0	0	0	0	0	2	5500000	440000	72000	72000	buró	72000	0.08	0.6	3000000	buró	5	0	0	8	8	8	10	10	10	10	6	0.026258333333333335	0.026258333333333335	0.026258333333333335	6	8.333333333333334	2	8	7.6	-	No Deseable	?	+	=	=	0	+	\N	3000000	0:00:00
22	46	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	0	0	aval1	aval2	aval3	2	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	1	9658000	772640	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	8	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.9036144578313253	8	0	7.2	?	No Deseable	?	=	?	=	0	+	\N	3000000	0:00:00
23	48	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.9036144578313253	8	0	7	?	No Deseable	?	=	?	=	0	+	\N	3000000	0:00:00.016000
24	49	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.9036144578313253	8	0	7	?	No Deseable	?	=	?	=	0	+	\N	3000000	0:00:00.016000
25	50	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.9036144578313253	8	0	7	?	No Deseable	?	=	?	=	0	+	\N	3000000	0:00:00
26	51	{10,15,20,25,30}	{50000}	{120000,150000,200000}	5000	{45000,55000,65000}	30000	1000000	{100000}	332000	342000	10000000	800000	Líquida	0	aval1	aval2	aval3	8	0	5	17000	0	MOP 2	MOP 1	0	20	123	77000	3	Sin información	Sí	0	0	0	0	0	0	0	0	0	0	0	0	2	19316000	1545280	199200	199200	buró	199200	0.08	0.6	3000000	buró	0.7704	8	8	8	8	6	10	10	10	8	10	0.05120481927710843	0	0.05120481927710843	0	0.9036144578313253	8	0	7	?	No Deseable	?	=	?	=	0	+	\N	3000000	0:00:00
\.


--
-- Data for Name: pyme_traditional_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) FROM stdin;
1	1	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	\N	\N	\N
22	18	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	24262.500000000004	0:00:00.015000	100000	174000	44445
2	2	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
23	19	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	24262.500000000004	0:00:00	100000	174000	44445
3	3	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
4	5	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
5	6	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
24	20	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	1579.125	0:00:00	100000	174000	44445
6	7	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
25	21	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	3641.250000000001	0:00:00	100000	174000	44445
26	23	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	3641.250000000001	0:00:00	100000	174000	44445
7	9	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
8	9	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	40.275000000000006	0:00:00	100000	174000	44445
9	10	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
10	10	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	40.275000000000006	0:00:00	100000	174000	44445
11	11	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00.016000	0	0	0
27	24	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	3641.250000000001	0:00:00	100000	174000	44445
12	12	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
13	13	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	0	0	0
14	14	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	100000	0	0
15	14	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	40.275000000000006	0:00:00	100000	174000	44445
16	15	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	0	0	0	0	0	0	0:00:00	100000	0	0
17	15	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	40.275000000000006	0:00:00	100000	174000	44445
18	16	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	40.275000000000006	0:00:00.015000	100000	174000	44445
19	16	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	40.275000000000006	0:00:00.015000	100000	174000	44445
20	17	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	6.2	1	8.15	0	0	7	3151	MOP 1	1	20	123	5.4	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	2	{0.5,0.55,0.57,0.57,0.57}	0.529	10	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	10	25000	0.5555555555555556	10	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	10	102.85714285714286	-205.4142857142857	10	0.12	4	8	10	1	2	10	10	10	8	0	8	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	40.275000000000006	0:00:00	100000	174000	44445
21	17	{50000,55000,57000,57000,57000}	{10000,20000,30000}	{120000,150000,200000,200000,200000}	30000	5000	{45000,55000,65000}	35	{35,35,35,35,35}	{10555,10555,10555,10555,10555}	30000	30	250	150	2000	2000	10	100	1000000	\N	\N	{100000,100000,100000,100000,100000}	\N	2000	120000	250000	50	50	800000	40000	Líquida	0	0	1	0	0	0	7	3151	MOP 1	1	20	123	0	Principal proveedor o cliente es Gobierno	Compraventa de artículos no clasificados en otra parte	Sin información	Prácticas ESG	30	30	No	No	50	0	0	0	0	0	0	0	0	0	0	0	0	30	30	0	-0.12	0	{0.5,0.55,0.57,0.57,0.57}	0.529	0	{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}	0.37533333333333335	0	25000	0.5555555555555556	0	4.263382283278068	\N	7.5	0	308.57142857142856	8.75	0.30000000000000004	333.33333333333326	2.6122916666666667	0	102.85714285714286	-205.4142857142857	0	0.12	0	0	0	1	2	10	10	10	0	0	0	4000	0	0	Atrasos poco relevantes	=	=	No Deseable	Pérdida en 2 ejercicios	=	?	+	500.0	+	1	=	0	=	=	=	\N	0.6	0.3	0.08	0.33	0.08	20000000	72000	30000	13920	29333.7	50	40.275000000000006	0:00:00	100000	174000	44445
\.


--
-- Data for Name: reporting_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) FROM stdin;
1	1	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
2	2	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
3	3	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
4	4	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
5	5	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
6	6	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
7	7	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
8	8	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
9	9	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
10	10	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00.016000
11	11	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
12	12	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
13	13	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
14	14	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
15	15	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
16	16	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
17	17	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
18	18	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
19	19	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
20	20	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
21	21	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
22	22	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
23	23	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
24	24	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
25	25	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
26	26	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
27	27	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
28	28	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
29	29	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
30	30	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
31	31	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
32	32	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
33	33	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
34	34	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
35	35	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
36	36	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
37	37	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
38	38	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
39	39	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
40	40	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
41	41	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00.016000
42	42	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
43	43	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
44	44	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
45	45	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	246849	30000	0:00:00
46	46	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
47	48	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
48	49	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
49	50	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
50	51	0.5	0.375	0.4166666666666667	0.6666666666666666	\N	8	17.666666666666668	1.5	1.5	-0.2	-0.18181818181818182	325000	30000	0:00:00
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
1	admin	admin	admin@naira.com	$2b$12$jWzdOyahOEftUcbZrsCP4./pb2i8yNWjXQhFKPaGncrKLgHEz74X6	t	f	2023-03-28 18:33:51.365723
\.


--
-- Name: admin_aggrupation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_aggrupation_id_seq', 6, true);


--
-- Name: admin_aggrupation_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_aggrupation_option_id_seq', 27, true);


--
-- Name: admin_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_condition_id_seq', 54, true);


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

SELECT pg_catalog.setval('public.admin_discretization_condition_id_seq', 178, true);


--
-- Name: admin_discretization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_discretization_id_seq', 27, true);


--
-- Name: admin_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_field_id_seq', 101, true);


--
-- Name: admin_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_rule_id_seq', 16, true);


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

SELECT pg_catalog.setval('public.admin_score_rule_id_seq', 6, true);


--
-- Name: admin_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_status_id_seq', 7, true);


--
-- Name: creditapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.creditapplication_id_seq', 51, true);


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

SELECT pg_catalog.setval('public.pyme_express_indicator_id_seq', 26, true);


--
-- Name: pyme_traditional_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pyme_traditional_indicator_id_seq', 27, true);


--
-- Name: reporting_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reporting_indicator_id_seq', 50, true);


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

