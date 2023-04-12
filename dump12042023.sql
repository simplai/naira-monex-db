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

INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (1, 'Score Qualitative', NULL, 'express', 15);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (2, 'Score Quantitative', NULL, 'express', 14);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (3, 'Score Behaviour', NULL, 'express', 16);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (5, 'Score Qualitative', NULL, 'tradicional', 74);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (4, 'Score Quantitative', NULL, 'tradicional', 73);
INSERT INTO public.admin_aggrupation (id, name, description, router, field_id) VALUES (6, 'Score Behaviour', NULL, 'tradicional', 75);


--
-- Data for Name: admin_aggrupation_option; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (4, 100, 21, 2);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (5, 10, 30, 3);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (6, 20, 45, 3);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (7, 20, 35, 3);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (8, 20, 37, 3);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (9, 10, 39, 3);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (10, 10, 41, 3);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (11, 10, 43, 3);
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
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (1, 100, 17, 1);


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
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (10, 50, NULL, NULL, '{+}', false, 1, 9);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (11, 46, NULL, NULL, '{-}', false, 1, 10);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (12, 46, NULL, NULL, '{?}', false, 1, 11);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (13, 48, NULL, NULL, '{?}', false, 2, 11);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (14, 49, NULL, NULL, '{?}', false, 3, 11);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (15, 50, NULL, NULL, '{?}', false, 4, 11);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (54, 47, NULL, NULL, '{?}', false, 5, 11);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (16, 49, NULL, NULL, '{+}', false, 1, 12);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (17, 47, NULL, NULL, '{+}', false, 2, 12);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, "order", rule_id) VALUES (53, 48, NULL, NULL, '{-}', false, 2, 10);


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

INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (1, 'Score Leverage', NULL, 20, 21, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (2, 'Score operation Antiquity', NULL, 23, 17, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (5, 'Monex Payment Experience', NULL, 29, 30, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (6, 'Score Credit Antiquity Client', NULL, 33, 31, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (7, 'Score Credit Antiquity Client', NULL, 33, 32, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (8, 'Score Payment Bureau Behaviour', NULL, 34, 35, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (9, 'Score Historic Behaviour', NULL, 36, 37, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (10, 'Score Relevant Delays', NULL, 38, 39, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (11, 'Score Credit Relevance', NULL, 40, 41, true, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, target_id, pyme_express, pyme_traditional, factoring) VALUES (12, 'Score Observation Keys', NULL, 42, 43, true, false, false);
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


--
-- Data for Name: admin_discretization_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (1, NULL, 1, 0.5, NULL, '{}', false, 10, 1);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (2, NULL, 2, 0.5, 1, '{}', false, 8, 1);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (3, NULL, 3, 1, 2, '{}', false, 6, 1);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (4, NULL, 4, 2, 2.5, '{}', false, 4, 1);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (5, NULL, 5, 2.5, 3, '{}', false, 2, 1);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (6, NULL, 6, NULL, 3, '{}', false, 0, 1);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (74, NULL, 1, 2, 3, '{}', false, 4, 2);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (78, NULL, 1, NULL, NULL, '{}', true, 0, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (79, NULL, 2, -0.15, NULL, '{}', false, 0, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (80, NULL, 3, -0.15, -0.1, '{}', false, 2, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (81, NULL, 4, -0.1, 0, '{}', false, 4, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (82, NULL, 5, 0, 0.03, '{}', false, 6, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (83, NULL, 6, 0.03, 0.07, '{}', false, 8, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (28, NULL, 1, NULL, NULL, '{1}', false, 10, 5);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (29, NULL, 2, NULL, NULL, '{2}', false, 8, 5);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (30, NULL, 3, NULL, NULL, '{3,8}', false, 6, 5);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (31, NULL, 4, NULL, NULL, '{4}', false, 4, 5);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (32, NULL, 5, NULL, NULL, '{5}', false, 2, 5);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (33, NULL, 6, NULL, NULL, '{6,7}', false, 0, 5);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (34, NULL, 1, 0.5, NULL, '{}', false, 0, 6);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (35, NULL, 2, NULL, NULL, '{0.5}', false, 2, 6);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (36, NULL, 3, 0.5, 1, '{}', false, 4, 6);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (37, NULL, 4, 1, 2, '{}', false, 6, 6);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (38, NULL, 5, 2, 3, '{}', false, 8, 6);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (39, NULL, 6, NULL, 3, '{}', false, 10, 6);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (40, NULL, 1, 0.5, NULL, '{}', false, 0, 7);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (41, NULL, 2, NULL, NULL, '{0.5}', false, 2, 7);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (42, NULL, 3, 0.5, 0.8, '{}', false, 4, 7);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (43, NULL, 4, 0.8, 1, '{}', false, 6, 7);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (44, NULL, 5, 1, 1.5, '{}', false, 8, 7);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (45, NULL, 6, NULL, 1.5, '{}', false, 10, 7);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (46, NULL, 1, NULL, NULL, '{"MOP 1"}', false, 10, 8);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (47, NULL, 2, NULL, NULL, '{"MOP 2"}', false, 8, 8);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (48, NULL, 3, NULL, NULL, '{"Sin información"}', false, 4, 8);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (49, NULL, 4, NULL, NULL, '{"MOP 3","Mayor o igual a MOP 4"}', false, 0, 8);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (50, NULL, 1, NULL, NULL, '{"MOP 1"}', false, 10, 9);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (51, NULL, 2, NULL, NULL, '{"MOP 2"}', false, 8, 9);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (52, NULL, 3, NULL, NULL, '{"MOP 3"}', false, 6, 9);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (53, NULL, 4, NULL, NULL, '{"Sin información"}', false, 4, 9);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (54, NULL, 5, NULL, NULL, '{"Mayor o igual a MOP 4"}', false, 0, 9);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (55, NULL, 1, 0.01, NULL, '{}', false, 10, 10);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (56, NULL, 2, NULL, NULL, '{0.01}', false, 10, 10);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (57, NULL, 3, 0.01, 0.02, '{}', false, 8, 10);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (58, NULL, 4, 0.02, 0.03, '{}', false, 6, 10);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (59, NULL, 5, 0.03, 0.04, '{}', false, 4, 10);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (60, NULL, 6, 0.04, 0.05, '{}', false, 2, 10);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (61, NULL, 7, NULL, 0.05, '{}', false, 0, 10);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (63, NULL, 2, NULL, NULL, '{0.6}', false, 10, 11);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (65, NULL, 4, 1, 1.5, '{}', false, 6, 11);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (66, NULL, 5, 1.5, 2, '{}', false, 4, 11);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (67, NULL, 6, NULL, NULL, '{2}', false, 2, 11);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (69, NULL, 1, NULL, NULL, '{"No presenta clave"}', false, 10, 12);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (70, NULL, 2, NULL, NULL, '{1}', false, 8, 12);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (71, NULL, 3, NULL, NULL, '{2}', false, 6, 12);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (72, NULL, 4, NULL, NULL, '{3}', false, 0, 12);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (73, NULL, 5, NULL, NULL, '{"Sin historial"}', false, 6, 12);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (75, NULL, 2, 3, 5, '{}', false, 6, 2);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (76, NULL, 3, 5, 10, '{}', false, 8, 2);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (77, NULL, 4, NULL, 10, '{}', false, 10, 2);
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
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (62, NULL, 1, 0.6, NULL, '{}', false, 10, 11);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (64, NULL, 3, 0.6, 1, '{}', false, 8, 11);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (68, NULL, 7, NULL, 2, '{}', false, 2, 11);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (96, NULL, 5, 0.01, 0.05, '{}', false, 6, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (97, NULL, 6, 0.05, 0.07, '{}', false, 8, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (98, NULL, 7, NULL, 0.07, '{}', false, 10, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (99, NULL, 1, NULL, NULL, '{}', true, 8, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (100, NULL, 2, 1.5, NULL, '{}', false, 10, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (101, NULL, 3, 1.5, 2, '{}', false, 8, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (102, NULL, 4, 2, 2.5, '{}', false, 6, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (103, NULL, 5, 2.5, 3, '{}', false, 4, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (104, NULL, 6, 3, 4, '{}', false, 2, 16);
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


--
-- Data for Name: admin_field; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_field (id, field) VALUES (14, 'express.score_quantitative');
INSERT INTO public.admin_field (id, field) VALUES (16, 'express.score_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (15, 'express.score_qualitative');
INSERT INTO public.admin_field (id, field) VALUES (17, 'express.score_operation_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (18, 'express.score_shareholder_experience');
INSERT INTO public.admin_field (id, field) VALUES (19, 'express.score_business_stability');
INSERT INTO public.admin_field (id, field) VALUES (20, 'express.leverage');
INSERT INTO public.admin_field (id, field) VALUES (21, 'express.score_leverage');
INSERT INTO public.admin_field (id, field) VALUES (22, 'n_employees');
INSERT INTO public.admin_field (id, field) VALUES (23, 'operation_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (25, 'express.shareholder_experience');
INSERT INTO public.admin_field (id, field) VALUES (27, 'express.business_stability');
INSERT INTO public.admin_field (id, field) VALUES (29, 'express.monex_payment_experience');
INSERT INTO public.admin_field (id, field) VALUES (30, 'express.score_monex_payment_experience');
INSERT INTO public.admin_field (id, field) VALUES (31, 'express.score_antiquity_client');
INSERT INTO public.admin_field (id, field) VALUES (32, 'express.score_antiquity_no_client');
INSERT INTO public.admin_field (id, field) VALUES (33, 'express.credit_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (34, 'express.payment_bureau_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (35, 'express.score_payment_bureau_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (36, 'express.historic_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (37, 'express.score_historic_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (38, 'express.relevant_delays');
INSERT INTO public.admin_field (id, field) VALUES (39, 'express.score_relevant_delays');
INSERT INTO public.admin_field (id, field) VALUES (40, 'express.line_proposal_max_bureau');
INSERT INTO public.admin_field (id, field) VALUES (41, 'express.score_credit_relevance');
INSERT INTO public.admin_field (id, field) VALUES (42, 'express.observation_keys');
INSERT INTO public.admin_field (id, field) VALUES (43, 'express.score_observation_keys');
INSERT INTO public.admin_field (id, field) VALUES (44, 'express.score_behaviour');
INSERT INTO public.admin_field (id, field) VALUES (45, 'express.score_credit_antiquity');
INSERT INTO public.admin_field (id, field) VALUES (46, 'express.score_anual_inferred_income');
INSERT INTO public.admin_field (id, field) VALUES (47, 'express.score_profitability');
INSERT INTO public.admin_field (id, field) VALUES (48, 'express.score_economic_sector');
INSERT INTO public.admin_field (id, field) VALUES (49, 'express.score_esg');
INSERT INTO public.admin_field (id, field) VALUES (51, 'express.score_sum_wallet_more_31');
INSERT INTO public.admin_field (id, field) VALUES (52, 'express.solvency');
INSERT INTO public.admin_field (id, field) VALUES (53, 'express.score_solvency');
INSERT INTO public.admin_field (id, field) VALUES (50, 'express.score_liquid_pledge');
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


--
-- Data for Name: admin_rule; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (14, 'Score - Rules', NULL, false, true, 1, 1);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (15, 'Score ? Rule', NULL, false, true, 2, 5);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (16, 'Score + Rule', NULL, false, true, 3, 2);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (9, 'Score Liquid Pledge', NULL, true, false, 1, 2);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (10, 'Scores Inferred Incomes, Score Economic Activity', NULL, true, false, 2, 1);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (11, 'Score Inferred Income, Score Economic Activity, Score ESG, Score Liquid Pledge, Score Profitability', NULL, true, false, 3, 5);
INSERT INTO public.admin_rule (id, name, description, pyme_express, pyme_traditional, "order", action_id) VALUES (12, 'Score Profitability, Score ESG', NULL, true, false, 4, 2);


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

INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (1, 'Score Quantitative', NULL, 14, 1.5, true, false, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (2, 'Score Qualitative', NULL, 15, 1.5, true, false, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (3, 'Score Behaviour', NULL, 16, 7, true, false, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (4, 'Score Quantitative', NULL, 73, 2, false, true, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (5, 'Score Qualitative', NULL, 74, 2, false, true, false, true);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, pyme_traditional, factoring, use_field_value) VALUES (6, 'Score Behaviour', NULL, 75, 6, false, true, false, true);


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

INSERT INTO public.alembic_version (version_num) VALUES ('ddbbfcf905f5');

--
-- Data for Name: factoring_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: leasing_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: pyme_express_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (1, 4, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 0.644, 8, 8, 8, 9.2, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.029425, 0.029425, 6, 0.6, 10, 8, 8.4, '?', 'No Deseable', '=', '+', '=', '=', 0, '+', NULL, 0, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (2, 22, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 0.644, 8, 8, 8, 9.2, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.029425, 0.029425, 6, 0.6, 10, 8, 8.4, '?', 'No Deseable', '=', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00.015000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (3, 27, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 2.5, 0, NULL, 0, NULL, 0, 10, 10, 10, 0, 0, 0.026258333333333335, 0.029425, 0.029425, 0, 0.6, 0, 0, 0, '?', 'No Deseable', '=', '+', '=', '=', 0, '+', NULL, 0, '0:00:00.016000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (4, 28, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 2.5, 2, 2, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.029425, 0.029425, 6, 0.6, 10, 8, 8.4, '?', 'No Deseable', '=', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00.015000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (5, 29, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 2.5, 2, 2, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.029425, 0.029425, 6, 0.6, 10, 8, 8.4, '?', 'No Deseable', '=', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00.015000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (6, 30, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 2.5, 2, 2, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.029425, 0.029425, 6, 0.6, 10, 8, 8.4, '?', 'No Deseable', '=', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (7, 31, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 2.5, 2, 2, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.029425, 0.029425, 6, 0.6, 10, 8, 8.4, '?', 'No Deseable', '=', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00.016000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (8, 32, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 2.5, 2, 2, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.029425, 0.029425, 6, 0.6, 10, 8, 8.4, '?', 'No Deseable', '=', '+', '+', '=', 0, '+', NULL, 0, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (9, 33, '{10,15,20,25,30}', '{50000}', '{120000,150000,30000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 6000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3531, 'MOP 1', 'MOP 3', 20, 20, 123, 0, 1, 'Prácticas ESG', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11500000, 920000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 2.5, 2, 2, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.029425, 0.029425, 6, 0.6, 10, 8, 8.4, '?', 'No Deseable', '=', '+', '+', '=', 0, '+', NULL, 3000000, '0:00:00.015000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (10, 34, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.6, 10, 0, 7.2, '?', 'No Deseable', '=', '=', '+', '=', 0, '+', NULL, 3000000, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (11, 35, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.6, 10, 0, 7.2, '?', 'No Deseable', '=', '=', '+', '=', 0, '+', NULL, 3000000, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (12, 36, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.6, 10, 0, 7.2, '?', 'No Deseable', '=', '=', '+', '=', 0, '+', NULL, 3000000, '0:00:00.015000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (13, 37, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.6, 10, 0, 7.2, '?', 'No Deseable', '=', '=', '+', '=', 0, '+', NULL, 3000000, '0:00:00.016000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (14, 38, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.6, 10, 0, 7.2, '?', 'No Deseable', '=', '=', '+', '=', 0, '+', NULL, 3000000, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (15, 39, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.6, 10, 0, 7.2, '?', 'No Deseable', '?', '=', '+', '=', 0, '+', NULL, 3000000, '0:00:00.016000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (16, 40, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.6, 10, 0, 7.2, '?', 'No Deseable', '?', '=', '?', '=', 0, '+', NULL, 3000000, '0:00:00.015000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (17, 41, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 3000000, 800000, '0', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3151, 'MOP 1', 'MOP 3', 0, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 5500000, 440000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 5, 0, 0, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.026258333333333335, 0.026258333333333335, 6, 0.6, 10, 8, 8.4, '-', 'No Deseable', '?', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00.016000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (18, 42, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 3000000, 800000, '0', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3151, 'MOP 1', 'MOP 3', 0, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 5500000, 440000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 5, 0, 0, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.026258333333333335, 0.026258333333333335, 6, 0.6, 10, 8, 8.4, '-', 'No Deseable', '?', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (19, 43, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 3000000, 800000, '0', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3151, 'MOP 1', 'MOP 3', 0, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 5500000, 440000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 5, 0, 0, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.026258333333333335, 0.026258333333333335, 6, 0.6, 10, 8, 8.4, '-', 'No Deseable', '?', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00.015000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (20, 44, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 3000000, 800000, '0', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3151, 'MOP 1', 'MOP 3', 0, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 5500000, 440000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 5, 0, 0, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.026258333333333335, 0.026258333333333335, 6, 8.333333333333334, 0, 8, 7.3999999999999995, '-', 'No Deseable', '?', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00.016000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (21, 45, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 120000, 250000, 3000000, 800000, '0', 0, 'aval1', 'aval2', 'aval3', 2, 0, 7, 3151, 3151, 'MOP 1', 'MOP 3', 0, 20, 123, 0, 1, 'Prácticas ESG', 'No', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 5500000, 440000, 72000, 72000, 'buró', 72000, 0.08, 0.6, 3000000, 'buró', 5, 0, 0, 8, 8, 8, 10, 10, 10, 10, 6, 0.026258333333333335, 0.026258333333333335, 0.026258333333333335, 6, 8.333333333333334, 2, 8, 7.6, '-', 'No Deseable', '?', '+', '=', '=', 0, '+', NULL, 3000000, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (22, 46, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, '0', 0, 'aval1', 'aval2', 'aval3', 2, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 9658000, 772640, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 8, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.9036144578313253, 8, 0, 7.2, '?', 'No Deseable', '?', '=', '?', '=', 0, '+', NULL, 3000000, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (23, 48, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.9036144578313253, 8, 0, 7, '?', 'No Deseable', '?', '=', '?', '=', 0, '+', NULL, 3000000, '0:00:00.016000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (24, 49, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.9036144578313253, 8, 0, 7, '?', 'No Deseable', '?', '=', '?', '=', 0, '+', NULL, 3000000, '0:00:00.016000');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (25, 50, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.9036144578313253, 8, 0, 7, '?', 'No Deseable', '?', '=', '?', '=', 0, '+', NULL, 3000000, '0:00:00');
INSERT INTO public.pyme_express_indicator (id, naira_id, anual_sales, net_utility_ltm, sales_ltm, cash, ebitda_ltm, operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income, total_liabilities, warranty_type, warranty_value, endorsement_1, endorsement_2, endorsement_3, monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay, payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay, profitability, observation_keys, esg, liquid_pledge, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, term_years, payment_capacity, adjusted_payment_capacity, adjusted_max_bureau_line, line_score, line_proposal_selection, line_proposal, line_factor1, line_factor2, product_limit, line_proposal_final, leverage, score_leverage, score_quantitative, score_operation_antiquity, score_qualitative, score_monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_payment_bureau_behaviour, score_historic_behaviour, actual_delay_amount, historic_delay_amount, relevant_delays, score_relevant_delays, line_proposal_max_bureau, score_credit_relevance, score_observation_keys, score_behaviour, score_anual_inferred_income, economic_sector_adjustment, score_economic_sector, score_esg, score_liquid_pledge, score_profitability, solvency, score_solvency, business_profile, line_granted, exec_time) VALUES (26, 51, '{10,15,20,25,30}', '{50000}', '{120000,150000,200000}', 5000, '{45000,55000,65000}', 30000, 1000000, '{100000}', 332000, 342000, 10000000, 800000, 'Líquida', 0, 'aval1', 'aval2', 'aval3', 8, 0, 5, 17000, 0, 'MOP 2', 'MOP 1', 0, 20, 123, 77000, 3, 'Sin información', 'Sí', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 19316000, 1545280, 199200, 199200, 'buró', 199200, 0.08, 0.6, 3000000, 'buró', 0.7704, 8, 8, 8, 8, 6, 10, 10, 10, 8, 10, 0.05120481927710843, 0, 0.05120481927710843, 0, 0.9036144578313253, 8, 0, 7, '?', 'No Deseable', '?', '=', '?', '=', 0, '+', NULL, 3000000, '0:00:00');


--
-- Data for Name: pyme_traditional_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (1, 1, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', NULL, NULL, NULL);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (22, 18, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 24262.500000000004, '0:00:00.015000', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (2, 2, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (23, 19, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 24262.500000000004, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (3, 3, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (4, 5, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (5, 6, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (24, 20, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 1579.125, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (6, 7, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (25, 21, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 3641.250000000001, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (26, 23, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 3641.250000000001, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (7, 9, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (8, 9, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 40.275000000000006, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (9, 10, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (10, 10, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 40.275000000000006, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (11, 11, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00.016000', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (27, 24, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 3641.250000000001, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (12, 12, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (13, 13, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 0, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (14, 14, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 100000, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (15, 14, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 40.275000000000006, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (16, 15, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 0, 0, 0, 0, 0, 0, '0:00:00', 100000, 0, 0);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (17, 15, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 40.275000000000006, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (18, 16, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 40.275000000000006, '0:00:00.015000', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (19, 16, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 40.275000000000006, '0:00:00.015000', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (20, 17, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 6.2, 1, 8.15, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 5.4, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 2, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 10, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 10, 25000, 0.5555555555555556, 10, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 10, 102.85714285714286, -205.4142857142857, 10, 0.12, 4, 8, 10, 1, 2, 10, 10, 10, 8, 0, 8, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 40.275000000000006, '0:00:00', 100000, 174000, 44445);
INSERT INTO public.pyme_traditional_indicator (id, naira_id, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm, sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable, taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet, total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line, credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow, warranty_type, warranty_value, score_qualitative, shareholder_experience, score_quantitative, monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m, days_delay, amount_delay, score_behaviour, government_dependencies, economic_activity, warranties, esg, current_asssets, current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59, default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3, sales_evolution, score_sales_evolution, roes, avg_roe, score_avg_roe, net_margins, avg_net_margins, score_avg_net_margins, financial_debt_net, financial_debt_ebitda, score_financial_debt_ebitda, interest_coverage, score_interest_converage, cash_flow, score_cash_flow, days_accounts_payable, accounts_payable_90d, days_accounts_receivable, accounts_receivable_90d, adjusted_working_equity, score_adjusted_working_equity, inventory_days, cash_cycle, score_cash_cycle, assets_rotation, score_assets_rotation, score_operation_antiquity, score_shareholder_experience, business_stability, monex_payment_experience, score_antiquity_client, score_antiquity_no_client, score_credit_antiquity, score_max_delays_12m, score_past_due_avg_days, score_interest_coverage, total_finacial_debt, score_business_stability, score_monex_payment_experience, adjusted_payment_bureau_behaviour, score_payment_bureau_behaviour, score_operation_antiquity_rule, economic_activity_adjustment, profitability, score_profitability, score_government_dependencies, score_esg, property_solvency, score_property_solvency, exchange_op_liquity, score_exchange_op, wallet_quality, score_factoring, score_economic_activity, score_warranties, business_profile, line_factor1, line_factor2, line_factor3, line_factor4, line_factor5, product_limit, adjusted_max_bureau_line, adjusted_avg_equity, adjusted_sales_ltm, adjusted_payment_capacity, adjusted_equity, line_granted, exec_time, mean_stockholders_equity, mean_sales_ltm, mean_payment_capacity) VALUES (21, 17, '{50000,55000,57000,57000,57000}', '{10000,20000,30000}', '{120000,150000,200000,200000,200000}', 30000, 5000, '{45000,55000,65000}', 35, '{35,35,35,35,35}', '{10555,10555,10555,10555,10555}', 30000, 30, 250, 150, 2000, 2000, 10, 100, 1000000, NULL, NULL, '{100000,100000,100000,100000,100000}', NULL, 2000, 120000, 250000, 50, 50, 800000, 40000, 'Líquida', 0, 0, 1, 0, 0, 0, 7, 3151, 'MOP 1', 1, 20, 123, 0, 'Principal proveedor o cliente es Gobierno', 'Compraventa de artículos no clasificados en otra parte', 'Sin información', 'Prácticas ESG', 30, 30, 'No', 'No', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '30', '30', '0', -0.12, 0, '{0.5,0.55,0.57,0.57,0.57}', 0.529, 0, '{0.4166666666666667,0.36666666666666664,0.285,0.285,0.285}', 0.37533333333333335, 0, 25000, 0.5555555555555556, 0, 4.263382283278068, NULL, 7.5, 0, 308.57142857142856, 8.75, 0.30000000000000004, 333.33333333333326, 2.6122916666666667, 0, 102.85714285714286, -205.4142857142857, 0, 0.12, 0, 0, 0, 1, 2, 10, 10, 10, 0, 0, 0, 4000, 0, 0, 'Atrasos poco relevantes', '=', '=', 'No Deseable', 'Pérdida en 2 ejercicios', '=', '?', '+', '500.0', '+', 1, '=', '0', '=', '=', '=', NULL, 0.6, 0.3, 0.08, 0.33, 0.08, 20000000, 72000, 30000, 13920, 29333.7, 50, 40.275000000000006, '0:00:00', 100000, 174000, 44445);


--
-- Data for Name: reporting_indicator; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (1, 1, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (2, 2, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (3, 3, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (4, 4, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (5, 5, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (6, 6, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (7, 7, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (8, 8, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (9, 9, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (10, 10, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00.016000');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (11, 11, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (12, 12, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (13, 13, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (14, 14, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (15, 15, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (16, 16, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (17, 17, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (18, 18, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (19, 19, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (20, 20, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (21, 21, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (22, 22, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (23, 23, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (24, 24, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (25, 25, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (26, 26, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (27, 27, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (28, 28, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (29, 29, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (30, 30, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (31, 31, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (32, 32, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (33, 33, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (34, 34, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (35, 35, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (36, 36, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (37, 37, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (38, 38, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (39, 39, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (40, 40, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (41, 41, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00.016000');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (42, 42, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (43, 43, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (44, 44, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (45, 45, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 246849, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (46, 46, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (47, 48, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (48, 49, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (49, 50, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');
INSERT INTO public.reporting_indicator (id, naira_id, roe, ebitda_margin, utility_margin, financial_debt_ebitda, liquity, leverage_rate, net_debt_ebitda, ebitda_liability, ebitda_financial_liability, sales_evolution, ebitda_evolution, available_balance, financial_liability_total, exec_time) VALUES (50, 51, 0.5, 0.375, 0.4166666666666667, 0.6666666666666666, NULL, 8, 17.666666666666668, 1.5, 1.5, -0.2, -0.18181818181818182, 325000, 30000, '0:00:00');


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
INSERT INTO public.users (id, name, "user", email, password, active, authenticated, last_action) VALUES (1, 'admin', 'admin', 'admin@naira.com', '$2b$12$jWzdOyahOEftUcbZrsCP4./pb2i8yNWjXQhFKPaGncrKLgHEz74X6', true, false, '2023-03-28 18:33:51.365723');


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

