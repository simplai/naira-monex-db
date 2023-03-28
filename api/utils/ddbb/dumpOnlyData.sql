--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (1, 40, 17, 1);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (2, 30, 18, 1);
INSERT INTO public.admin_aggrupation_option (id, percentage, field_id, aggrupation_id) VALUES (3, 30, 19, 1);
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


--
-- Data for Name: admin_status; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_status (id, status, weight) VALUES (4, 'KO', 0);
INSERT INTO public.admin_status (id, status, weight) VALUES (3, 'OK', 0);
INSERT INTO public.admin_status (id, status, weight) VALUES (1, '-', 10);
INSERT INTO public.admin_status (id, status, weight) VALUES (2, '+', 1);
INSERT INTO public.admin_status (id, status, weight) VALUES (5, '?', 6);
INSERT INTO public.admin_status (id, status, weight) VALUES (6, '=', 0);


--
-- Data for Name: admin_rule; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_rule (id, name, description, action_id, pyme_express, "order", pyme_traditional) VALUES (9, 'Score Anual Inferred income', NULL, 1, true, 1, false);
INSERT INTO public.admin_rule (id, name, description, action_id, pyme_express, "order", pyme_traditional) VALUES (10, 'Scores Profitability', NULL, 2, true, 2, false);
INSERT INTO public.admin_rule (id, name, description, action_id, pyme_express, "order", pyme_traditional) VALUES (11, 'Score Economic Sector, ESG, Solvency, Score Solvency', NULL, 1, true, 3, false);
INSERT INTO public.admin_rule (id, name, description, action_id, pyme_express, "order", pyme_traditional) VALUES (12, 'Score Profitability, Anual inferred Income, Liquid Pledge, Solvency, Score Solvency', NULL, 5, true, 4, false);
INSERT INTO public.admin_rule (id, name, description, action_id, pyme_express, "order", pyme_traditional) VALUES (13, 'Score Sum Wallet 31, Liquid Pledge', NULL, 2, true, 5, false);
INSERT INTO public.admin_rule (id, name, description, action_id, pyme_express, "order", pyme_traditional) VALUES (14, 'Score Payment Bureau Behaviour', NULL, 1, false, 1, true);


--
-- Data for Name: admin_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (10, 46, NULL, NULL, '{-}', false, 9, 1);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (11, 47, NULL, NULL, '{+}', false, 10, 1);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (12, 48, NULL, NULL, '{-}', false, 11, 1);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (13, 49, NULL, NULL, '{-}', false, 11, 2);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (14, 52, NULL, NULL, '{-}', false, 11, 3);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (15, 53, NULL, NULL, '{-}', false, 11, 4);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (16, 47, NULL, NULL, '{?}', false, 12, 1);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (17, 46, NULL, NULL, '{?}', false, 12, 2);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (18, 50, NULL, NULL, '{?}', false, 12, 3);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (19, 52, NULL, NULL, '{?}', false, 12, 4);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (20, 53, NULL, NULL, '{?}', false, 12, 5);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (21, 51, NULL, NULL, '{+}', false, 13, 1);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (22, 50, NULL, NULL, '{+}', false, 13, 2);
INSERT INTO public.admin_condition (id, field_id, min, max, allowed, allowed_na, rule_id, "order") VALUES (23, 89, NULL, NULL, '{-}', false, 14, 1);


--
-- Data for Name: admin_config; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_config (id, variable, key, value) VALUES (1, 'general', 'aggregation_provider', 'UNNAX');
INSERT INTO public.admin_config (id, variable, key, value) VALUES (2, 'general', 'ACCEPTED', 'OK');
INSERT INTO public.admin_config (id, variable, key, value) VALUES (3, 'general', 'REJECTED', 'KO');
INSERT INTO public.admin_config (id, variable, key, value) VALUES (4, 'general', 'REVIEW', 'Manual Review');
INSERT INTO public.admin_config (id, variable, key, value) VALUES (5, 'general', 'MAX_INACTIVE_SECS', '180');

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

INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (1, 'Score Leverage', NULL, 20, true, 21, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (2, 'Score operation Antiquity', NULL, 23, true, 17, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (3, 'Score Shareholder Experience', NULL, 25, true, 18, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (4, 'Score Business Stability', NULL, 27, true, 19, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (5, 'Monex Payment Experience', NULL, 29, true, 30, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (6, 'Score Credit Antiquity Client', NULL, 33, true, 31, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (7, 'Score Credit Antiquity Client', NULL, 33, true, 32, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (8, 'Score Payment Bureau Behaviour', NULL, 34, true, 35, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (9, 'Score Historic Behaviour', NULL, 36, true, 37, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (10, 'Score Relevant Delays', NULL, 38, true, 39, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (11, 'Score Credit Relevance', NULL, 40, true, 41, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (12, 'Score Observation Keys', NULL, 42, true, 43, false, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (13, 'Score Sales Evolution', NULL, 55, false, 56, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (14, 'Score Average ROE', NULL, 57, false, 58, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (15, 'Score Average Net Margins', NULL, 59, false, 60, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (16, 'Score Financial Debt / EBITDA', NULL, 61, false, 62, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (17, 'Score Interest Coverage', NULL, 63, false, 64, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (18, 'Score Cash Flow', NULL, 65, false, 66, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (19, 'Score Adjusted Working Equity', NULL, 67, false, 68, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (20, 'Score Cash Cycle', NULL, 69, false, 70, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (21, 'Score Asset Rotation', NULL, 71, false, 72, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (22, 'Score Operation Antiquity', NULL, 23, false, 90, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (23, 'Score Shareholder Experience', NULL, 79, false, 80, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (24, 'Score Business Stability', NULL, 81, false, 82, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (25, 'Score Monex Payment Experience', NULL, 83, false, 84, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (26, 'Score Max Delays 12m', NULL, 85, false, 86, true, false);
INSERT INTO public.admin_discretization (id, name, description, field_id, pyme_express, target_id, pyme_traditional, factoring) VALUES (27, 'Score Past Due Average Days', NULL, 87, false, 88, true, false);


--
-- Data for Name: admin_discretization_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (1, 0.5, NULL, '{}', false, 1, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (2, 0.5, 1, '{}', false, 1, 8, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (3, 1, 2, '{}', false, 1, 6, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (4, 2, 2.5, '{}', false, 1, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (5, 2.5, 3, '{}', false, 1, 2, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (6, NULL, 3, '{}', false, 1, 0, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (74, 2, 3, '{}', false, 2, 4, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (14, NULL, NULL, '{1}', false, 3, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (15, NULL, NULL, '{2}', false, 3, 8, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (16, NULL, NULL, '{3}', false, 3, 6, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (17, NULL, NULL, '{4}', false, 3, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (18, NULL, NULL, '{5}', false, 3, 2, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (19, NULL, NULL, '{6}', false, 3, 0, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (20, NULL, NULL, '{7}', false, 3, 0, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (21, NULL, NULL, '{8}', false, 3, 0, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (22, NULL, NULL, '{1}', false, 4, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (23, NULL, NULL, '{2}', false, 4, 8, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (24, NULL, NULL, '{3}', false, 4, 6, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (25, NULL, NULL, '{4}', false, 4, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (26, NULL, NULL, '{5}', false, 4, 2, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (27, NULL, NULL, '{6}', false, 4, 0, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (78, NULL, NULL, '{}', true, 13, 0, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (79, -0.15, NULL, '{}', false, 13, 0, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (80, -0.15, -0.1, '{}', false, 13, 2, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (81, -0.1, 0, '{}', false, 13, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (82, 0, 0.03, '{}', false, 13, 6, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (83, 0.03, 0.07, '{}', false, 13, 8, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (28, NULL, NULL, '{1}', false, 5, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (29, NULL, NULL, '{2}', false, 5, 8, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (30, NULL, NULL, '{3,8}', false, 5, 6, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (31, NULL, NULL, '{4}', false, 5, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (32, NULL, NULL, '{5}', false, 5, 2, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (33, NULL, NULL, '{6,7}', false, 5, 0, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (34, 0.5, NULL, '{}', false, 6, 0, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (35, NULL, NULL, '{0.5}', false, 6, 2, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (36, 0.5, 1, '{}', false, 6, 4, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (37, 1, 2, '{}', false, 6, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (38, 2, 3, '{}', false, 6, 8, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (39, NULL, 3, '{}', false, 6, 10, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (40, 0.5, NULL, '{}', false, 7, 0, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (41, NULL, NULL, '{0.5}', false, 7, 2, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (42, 0.5, 0.8, '{}', false, 7, 4, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (43, 0.8, 1, '{}', false, 7, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (44, 1, 1.5, '{}', false, 7, 8, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (45, NULL, 1.5, '{}', false, 7, 10, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (46, NULL, NULL, '{"MOP 1"}', false, 8, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (47, NULL, NULL, '{"MOP 2"}', false, 8, 8, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (48, NULL, NULL, '{"Sin información"}', false, 8, 4, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (49, NULL, NULL, '{"MOP 3","Mayor o igual a MOP 4"}', false, 8, 0, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (50, NULL, NULL, '{"MOP 1"}', false, 9, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (51, NULL, NULL, '{"MOP 2"}', false, 9, 8, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (52, NULL, NULL, '{"MOP 3"}', false, 9, 6, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (53, NULL, NULL, '{"Sin información"}', false, 9, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (54, NULL, NULL, '{"Mayor o igual a MOP 4"}', false, 9, 0, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (55, 0.01, NULL, '{}', false, 10, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (56, NULL, NULL, '{0.01}', false, 10, 10, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (57, 0.01, 0.02, '{}', false, 10, 8, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (58, 0.02, 0.03, '{}', false, 10, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (59, 0.03, 0.04, '{}', false, 10, 4, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (60, 0.04, 0.05, '{}', false, 10, 2, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (61, NULL, 0.05, '{}', false, 10, 0, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (62, 0.6, NULL, '{}', false, 11, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (63, NULL, NULL, '{0.6}', false, 11, 10, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (64, 0.6, 1, '{}', false, 11, 8, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (65, 1, 1.5, '{}', false, 11, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (66, 1.5, 2, '{}', false, 11, 4, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (67, NULL, NULL, '{2}', false, 11, 2, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (68, NULL, 2, '{}', false, 11, 0, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (69, NULL, NULL, '{"No presenta clave"}', false, 12, 10, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (70, NULL, NULL, '{1}', false, 12, 8, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (71, NULL, NULL, '{2}', false, 12, 6, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (72, NULL, NULL, '{3}', false, 12, 0, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (73, NULL, NULL, '{"Sin historial"}', false, 12, 6, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (75, 3, 5, '{}', false, 2, 6, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (76, 5, 10, '{}', false, 2, 8, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (77, NULL, 10, '{}', false, 2, 10, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (84, NULL, 0.07, '{}', false, 13, 10, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (85, NULL, NULL, '{}', true, 14, 8, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (86, -0.1, NULL, '{}', false, 14, 0, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (87, -0.1, -0.02, '{}', false, 14, 2, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (88, -0.02, 0.01, '{}', false, 14, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (89, 0.01, 0.05, '{}', false, 14, 6, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (90, 0.05, 0.07, '{}', false, 14, 8, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (91, NULL, 0.07, '{}', false, 14, 10, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (92, NULL, NULL, '{}', true, 15, 8, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (93, -0.1, NULL, '{}', false, 15, 0, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (94, -0.1, 0, '{}', false, 15, 2, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (95, 0, 0.01, '{}', false, 15, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (96, 0.01, 0.05, '{}', false, 15, 6, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (97, 0.05, 0.07, '{}', false, 15, 8, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (98, NULL, 0.07, '{}', false, 15, 10, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (99, NULL, NULL, '{}', true, 16, 8, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (100, 1.5, NULL, '{}', false, 16, 10, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (101, 1.5, 2, '{}', false, 16, 8, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (102, 2, 2.5, '{}', false, 16, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (103, 2.5, 3, '{}', false, 16, 4, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (104, 3, 4, '{}', false, 16, 2, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (105, NULL, 4, '{}', false, 16, 0, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (106, NULL, NULL, '{}', true, 17, 8, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (107, 1, NULL, '{}', false, 17, 0, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (108, 1, 1.5, '{}', false, 17, 2, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (109, 1.5, 2.5, '{}', false, 17, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (110, 2.5, 4, '{}', false, 17, 6, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (111, 4, 7, '{}', false, 17, 8, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (112, NULL, 7, '{}', false, 17, 10, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (113, NULL, NULL, '{}', true, 18, 8, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (114, 0.06, NULL, '{}', false, 18, 0, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (115, 0.06, 0.09, '{}', false, 18, 2, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (116, 0.09, 0.13, '{}', false, 18, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (117, 0.13, 0.23, '{}', false, 18, 6, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (118, 0.23, 0.35, '{}', false, 18, 8, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (119, 0.35, NULL, '{}', false, 18, 10, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (120, NULL, NULL, '{}', true, 19, 8, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (121, 0.5, NULL, '{}', false, 19, 0, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (122, 0.5, 0.8, '{}', false, 19, 2, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (123, 0.8, 1, '{}', false, 19, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (124, 0.8, 1, '{}', false, 19, 6, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (125, 1, 2, '{}', false, 19, 8, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (126, 2, 3, '{}', false, 19, 10, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (127, NULL, NULL, '{}', true, 20, 8, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (128, 60, NULL, '{}', false, 20, 10, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (129, 60, 90, '{}', false, 20, 8, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (130, 90, 120, '{}', false, 20, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (131, 120, 150, '{}', false, 20, 4, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (132, 150, 180, '{}', false, 20, 2, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (133, NULL, 180, '{}', false, 20, 0, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (134, NULL, NULL, '{}', true, 21, 8, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (135, 0.02, NULL, '{}', false, 21, 0, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (136, 0.02, 0.07, '{}', false, 21, 2, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (137, 0.07, 0.25, '{}', false, 21, 4, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (138, 0.25, 0.5, '{}', false, 21, 6, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (139, 0.5, 0.75, '{}', false, 21, 8, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (140, NULL, 0.75, '{}', false, 21, 10, 7, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (141, NULL, NULL, '{"Sin información"}', true, 22, 0, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (142, 2, NULL, '{}', false, 22, 0, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (143, 2, 3, '{}', false, 22, 4, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (144, 3, 5, '{}', false, 22, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (145, 5, 10, '{}', false, 22, 8, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (146, NULL, 10, '{}', false, 22, 10, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (147, NULL, NULL, '{6,8,7}', true, 23, 0, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (148, NULL, NULL, '{5}', false, 23, 2, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (149, NULL, NULL, '{4}', false, 23, 4, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (150, NULL, NULL, '{3}', false, 23, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (151, NULL, NULL, '{2}', false, 23, 8, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (152, NULL, NULL, '{1}', false, 23, 10, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (153, NULL, NULL, '{6}', true, 24, 0, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (154, NULL, NULL, '{5}', false, 24, 2, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (155, NULL, NULL, '{4}', false, 24, 4, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (156, NULL, NULL, '{3}', false, 24, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (157, NULL, NULL, '{2}', false, 24, 8, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (158, NULL, NULL, '{1}', false, 24, 10, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (159, NULL, NULL, '{6}', false, 25, 0, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (160, NULL, NULL, '{5}', false, 25, 2, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (161, NULL, NULL, '{4}', false, 25, 4, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (162, NULL, NULL, '{3,7,5}', false, 25, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (163, NULL, NULL, '{2}', false, 25, 8, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (164, NULL, NULL, '{1}', false, 25, 10, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (165, NULL, NULL, '{"Sin información"}', true, 26, 6, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (166, NULL, NULL, '{0}', false, 26, 10, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (167, NULL, NULL, '{1}', false, 26, 8, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (168, NULL, NULL, '{2}', false, 26, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (169, NULL, NULL, '{3}', false, 26, 4, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (170, NULL, NULL, '{4}', false, 26, 2, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (171, NULL, 4, '{}', false, 26, 2, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (172, NULL, NULL, '{"Sin información"}', true, 27, 0, 1, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (173, NULL, NULL, '{0}', false, 27, 10, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (174, 1, 7, '{}', false, 27, 8, 3, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (175, 7, 25, '{}', false, 27, 6, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (176, 25, 36, '{}', false, 27, 4, 5, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (177, NULL, NULL, '{36}', false, 27, 2, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, min, max, allowed, allowed_na, discretization_id, final_value, "order", field_id) VALUES (178, NULL, 36, '{}', false, 27, 2, 7, NULL);


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
-- Data for Name: admin_score_rule; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, use_field_value, pyme_traditional, factoring) VALUES (1, 'Score Quantitative', NULL, 14, 1.5, true, true, false, false);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, use_field_value, pyme_traditional, factoring) VALUES (2, 'Score Qualitative', NULL, 15, 1.5, true, true, false, false);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, use_field_value, pyme_traditional, factoring) VALUES (3, 'Score Behaviour', NULL, 16, 7, true, true, false, false);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, use_field_value, pyme_traditional, factoring) VALUES (4, 'Score Quantitative', NULL, 73, 2, false, true, true, false);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, use_field_value, pyme_traditional, factoring) VALUES (5, 'Score Qualitative', NULL, 74, 2, false, true, true, false);
INSERT INTO public.admin_score_rule (id, name, description, field_id, weight, pyme_express, use_field_value, pyme_traditional, factoring) VALUES (6, 'Score Behaviour', NULL, 75, 6, false, true, true, false);


--
-- Data for Name: admin_score_option; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.role (id, name, description) VALUES (1, 'admin', 'admin');
INSERT INTO public.role (id, name, description) VALUES (2, 'gestor', 'gestor');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.users (id, name, "user", email, password, active, authenticated) VALUES (1, 'admin', 'admin', 'admin@naira.com', '$2b$12$jWzdOyahOEftUcbZrsCP4./pb2i8yNWjXQhFKPaGncrKLgHEz74X6', true, false);
INSERT INTO public.users (id, name, "user", email, password, active, authenticated) VALUES (2, 'gestor', 'gestor', 'gestor@naira.com', 'gestor', true, false);


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.role_user (user_id, role_id) VALUES (1, 1);
INSERT INTO public.role_user (user_id, role_id) VALUES (2, 2);


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

SELECT pg_catalog.setval('public.admin_condition_id_seq', 23, true);


--
-- Name: admin_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_config_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.admin_field_id_seq', 100, true);


--
-- Name: admin_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_rule_id_seq', 14, true);


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

SELECT pg_catalog.setval('public.admin_status_id_seq', 6, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

