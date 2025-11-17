--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (415ebe8)
-- Dumped by pg_dump version 16.9

-- Started on 2025-11-17 19:38:28 UTC

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

ALTER TABLE IF EXISTS ONLY public.xfreturn_item DROP CONSTRAINT IF EXISTS xfreturn_item_xfreturn_id_fkey;
ALTER TABLE IF EXISTS ONLY public.xfreturn_item DROP CONSTRAINT IF EXISTS xfreturn_item_uom_code_fkey;
ALTER TABLE IF EXISTS ONLY public.xfintake DROP CONSTRAINT IF EXISTS xfintake_transfer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.xfintake_item DROP CONSTRAINT IF EXISTS xfintake_item_uom_code_fkey;
ALTER TABLE IF EXISTS ONLY public.xfintake_item DROP CONSTRAINT IF EXISTS xfintake_item_location3_id_fkey;
ALTER TABLE IF EXISTS ONLY public.xfintake_item DROP CONSTRAINT IF EXISTS xfintake_item_location2_id_fkey;
ALTER TABLE IF EXISTS ONLY public.xfintake_item DROP CONSTRAINT IF EXISTS xfintake_item_location1_id_fkey;
ALTER TABLE IF EXISTS ONLY public.warehouse DROP CONSTRAINT IF EXISTS warehouse_parish_code_fkey;
ALTER TABLE IF EXISTS ONLY public.warehouse DROP CONSTRAINT IF EXISTS warehouse_custodian_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_warehouse DROP CONSTRAINT IF EXISTS user_warehouse_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_warehouse DROP CONSTRAINT IF EXISTS user_warehouse_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_warehouse DROP CONSTRAINT IF EXISTS user_warehouse_assigned_by_fkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_role_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_assigned_by_fkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_assigned_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_agency_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_to_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_reviewed_by_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_requested_by_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_item_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_from_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer DROP CONSTRAINT IF EXISTS transfer_event_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_item_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_event_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_donor_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake DROP CONSTRAINT IF EXISTS rtintake_xfreturn_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS rtintake_item_uom_code_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS rtintake_item_location3_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS rtintake_item_location2_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS rtintake_item_location1_id_fkey;
ALTER TABLE IF EXISTS ONLY public.reliefpkg DROP CONSTRAINT IF EXISTS reliefpkg_reliefrqst_id_fkey;
ALTER TABLE IF EXISTS ONLY public.relief_request_fulfillment_lock DROP CONSTRAINT IF EXISTS relief_request_fulfillment_lock_reliefrqst_id_fkey;
ALTER TABLE IF EXISTS ONLY public.relief_request_fulfillment_lock DROP CONSTRAINT IF EXISTS relief_request_fulfillment_lock_fulfiller_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_reliefrqst_id_fkey;
ALTER TABLE IF EXISTS ONLY public.item_location DROP CONSTRAINT IF EXISTS item_location_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.xfreturn DROP CONSTRAINT IF EXISTS fk_xfreturn_to_warehouse;
ALTER TABLE IF EXISTS ONLY public.xfreturn_item DROP CONSTRAINT IF EXISTS fk_xfreturn_item_inventory;
ALTER TABLE IF EXISTS ONLY public.xfreturn DROP CONSTRAINT IF EXISTS fk_xfreturn_fr_warehouse;
ALTER TABLE IF EXISTS ONLY public.xfintake DROP CONSTRAINT IF EXISTS fk_xfintake_warehouse;
ALTER TABLE IF EXISTS ONLY public.xfintake_item DROP CONSTRAINT IF EXISTS fk_xfintake_item_intake;
ALTER TABLE IF EXISTS ONLY public.transfer DROP CONSTRAINT IF EXISTS fk_transfer_to_warehouse;
ALTER TABLE IF EXISTS ONLY public.transfer_item DROP CONSTRAINT IF EXISTS fk_transfer_item_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.transfer_item DROP CONSTRAINT IF EXISTS fk_transfer_item_transfer;
ALTER TABLE IF EXISTS ONLY public.transfer_item DROP CONSTRAINT IF EXISTS fk_transfer_item_itembatch;
ALTER TABLE IF EXISTS ONLY public.transfer_item DROP CONSTRAINT IF EXISTS fk_transfer_item_inventory;
ALTER TABLE IF EXISTS ONLY public.transfer DROP CONSTRAINT IF EXISTS fk_transfer_fr_warehouse;
ALTER TABLE IF EXISTS ONLY public.rtintake DROP CONSTRAINT IF EXISTS fk_rtintake_warehouse;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS fk_rtintake_item_intake;
ALTER TABLE IF EXISTS ONLY public.role_permission DROP CONSTRAINT IF EXISTS fk_role_permission_role;
ALTER TABLE IF EXISTS ONLY public.role_permission DROP CONSTRAINT IF EXISTS fk_role_permission_perm;
ALTER TABLE IF EXISTS ONLY public.reliefrqst DROP CONSTRAINT IF EXISTS fk_reliefrqst_reliefrqst_status;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_item DROP CONSTRAINT IF EXISTS fk_reliefrqst_item_reliefrqstitem_status;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_item DROP CONSTRAINT IF EXISTS fk_reliefrqst_item_reliefrqst;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_item DROP CONSTRAINT IF EXISTS fk_reliefrqst_item_item;
ALTER TABLE IF EXISTS ONLY public.reliefrqst DROP CONSTRAINT IF EXISTS fk_reliefrqst_event;
ALTER TABLE IF EXISTS ONLY public.reliefrqst DROP CONSTRAINT IF EXISTS fk_reliefrqst_agency;
ALTER TABLE IF EXISTS ONLY public.reliefpkg DROP CONSTRAINT IF EXISTS fk_reliefpkg_warehouse;
ALTER TABLE IF EXISTS ONLY public.reliefpkg_item DROP CONSTRAINT IF EXISTS fk_reliefpkg_item_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.reliefpkg_item DROP CONSTRAINT IF EXISTS fk_reliefpkg_item_reliefpkg;
ALTER TABLE IF EXISTS ONLY public.reliefpkg_item DROP CONSTRAINT IF EXISTS fk_reliefpkg_item_itembatch;
ALTER TABLE IF EXISTS ONLY public.location DROP CONSTRAINT IF EXISTS fk_location_warehouse;
ALTER TABLE IF EXISTS ONLY public.itembatch DROP CONSTRAINT IF EXISTS fk_itembatch_warehouse;
ALTER TABLE IF EXISTS ONLY public.itembatch DROP CONSTRAINT IF EXISTS fk_itembatch_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.itembatch DROP CONSTRAINT IF EXISTS fk_itembatch_item;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS fk_item_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.item_location DROP CONSTRAINT IF EXISTS fk_item_location_inventory;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS fk_item_itemcatg;
ALTER TABLE IF EXISTS ONLY public.inventory DROP CONSTRAINT IF EXISTS fk_inventory_warehouse;
ALTER TABLE IF EXISTS ONLY public.inventory DROP CONSTRAINT IF EXISTS fk_inventory_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.inventory DROP CONSTRAINT IF EXISTS fk_inventory_item;
ALTER TABLE IF EXISTS ONLY public.dnintake DROP CONSTRAINT IF EXISTS fk_dnintake_warehouse;
ALTER TABLE IF EXISTS ONLY public.dnintake_item DROP CONSTRAINT IF EXISTS fk_dnintake_item_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.dnintake_item DROP CONSTRAINT IF EXISTS fk_dnintake_item_intake;
ALTER TABLE IF EXISTS ONLY public.dnintake_item DROP CONSTRAINT IF EXISTS fk_dnintake_item_donation_item;
ALTER TABLE IF EXISTS ONLY public.dbintake DROP CONSTRAINT IF EXISTS fk_dbintake_warehouse;
ALTER TABLE IF EXISTS ONLY public.custodian DROP CONSTRAINT IF EXISTS fk_custodian_parish;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS fk_batchlocation_warehouse;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS fk_batchlocation_location;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS fk_batchlocation_itembatch;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS fk_batchlocation_inventory;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS fk_agency_warehouse;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS fk_aar_user;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS fk_aar_updated_by;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS fk_aar_created_by;
ALTER TABLE IF EXISTS ONLY public.agency_account_request_audit DROP CONSTRAINT IF EXISTS fk_aar_audit_req;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS fk_aar_agency;
ALTER TABLE IF EXISTS ONLY public.agency_account_request_audit DROP CONSTRAINT IF EXISTS fk_aar_actor;
ALTER TABLE IF EXISTS ONLY public.donor DROP CONSTRAINT IF EXISTS donor_country_id_fkey;
ALTER TABLE IF EXISTS ONLY public.donation_item DROP CONSTRAINT IF EXISTS donation_item_uom_code_fkey;
ALTER TABLE IF EXISTS ONLY public.donation_item DROP CONSTRAINT IF EXISTS donation_item_item_id_fkey;
ALTER TABLE IF EXISTS ONLY public.donation_item DROP CONSTRAINT IF EXISTS donation_item_donation_id_fkey;
ALTER TABLE IF EXISTS ONLY public.donation DROP CONSTRAINT IF EXISTS donation_event_id_fkey;
ALTER TABLE IF EXISTS ONLY public.donation DROP CONSTRAINT IF EXISTS donation_donor_id_fkey;
ALTER TABLE IF EXISTS ONLY public.donation DROP CONSTRAINT IF EXISTS donation_custodian_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dnintake DROP CONSTRAINT IF EXISTS dnintake_donation_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_recipient_agency_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package_item DROP CONSTRAINT IF EXISTS distribution_package_item_package_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package_item DROP CONSTRAINT IF EXISTS distribution_package_item_item_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_event_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_assigned_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake DROP CONSTRAINT IF EXISTS dbintake_reliefpkg_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_uom_code_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_reliefpkg_id_inventory_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_location3_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_location2_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_location1_id_fkey;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS agency_parish_code_fkey;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS agency_ineligible_event_id_fkey;
DROP TRIGGER IF EXISTS trg_user_set_updated_at ON public."user";
DROP TRIGGER IF EXISTS trg_aar_set_updated_at ON public.agency_account_request;
DROP INDEX IF EXISTS public.uk_user_username;
DROP INDEX IF EXISTS public.uk_itembatch_inventory_batch_item;
DROP INDEX IF EXISTS public.uk_itembatch_inventory_batch;
DROP INDEX IF EXISTS public.uk_itembatch_1;
DROP INDEX IF EXISTS public.uk_inventory_1;
DROP INDEX IF EXISTS public.uk_aar_active_email;
DROP INDEX IF EXISTS public.ix_user_role_user_id;
DROP INDEX IF EXISTS public.ix_user_role_role_id;
DROP INDEX IF EXISTS public.ix_role_permission_role_id;
DROP INDEX IF EXISTS public.ix_role_permission_perm_id;
DROP INDEX IF EXISTS public.idx_role_code;
DROP INDEX IF EXISTS public.idx_notification_warehouse;
DROP INDEX IF EXISTS public.idx_notification_user_status;
DROP INDEX IF EXISTS public.idx_itemcatg_status_code;
DROP INDEX IF EXISTS public.idx_fulfillment_lock_user;
DROP INDEX IF EXISTS public.idx_fulfillment_lock_expires;
DROP INDEX IF EXISTS public.idx_distribution_package_warehouse;
DROP INDEX IF EXISTS public.idx_distribution_package_item_package;
DROP INDEX IF EXISTS public.idx_distribution_package_item_item;
DROP INDEX IF EXISTS public.idx_distribution_package_event;
DROP INDEX IF EXISTS public.idx_distribution_package_agency;
DROP INDEX IF EXISTS public.dk_xfreturn_3;
DROP INDEX IF EXISTS public.dk_xfreturn_2;
DROP INDEX IF EXISTS public.dk_xfreturn_1;
DROP INDEX IF EXISTS public.dk_xfintake_item_2;
DROP INDEX IF EXISTS public.dk_xfintake_item_1;
DROP INDEX IF EXISTS public.dk_user_agency_id;
DROP INDEX IF EXISTS public.dk_transfer_item_3;
DROP INDEX IF EXISTS public.dk_transfer_item_2;
DROP INDEX IF EXISTS public.dk_transfer_item_1;
DROP INDEX IF EXISTS public.dk_transfer_3;
DROP INDEX IF EXISTS public.dk_transfer_2;
DROP INDEX IF EXISTS public.dk_transfer_1;
DROP INDEX IF EXISTS public.dk_rtintake_item_2;
DROP INDEX IF EXISTS public.dk_rtintake_item_1;
DROP INDEX IF EXISTS public.dk_reliefrqst_item_2;
DROP INDEX IF EXISTS public.dk_reliefrqst_3;
DROP INDEX IF EXISTS public.dk_reliefrqst_2;
DROP INDEX IF EXISTS public.dk_reliefrqst_1;
DROP INDEX IF EXISTS public.dk_reliefpkg_item_3;
DROP INDEX IF EXISTS public.dk_reliefpkg_item_2;
DROP INDEX IF EXISTS public.dk_reliefpkg_item_1;
DROP INDEX IF EXISTS public.dk_reliefpkg_3;
DROP INDEX IF EXISTS public.dk_reliefpkg_1;
DROP INDEX IF EXISTS public.dk_location_1;
DROP INDEX IF EXISTS public.dk_itembatch_4;
DROP INDEX IF EXISTS public.dk_itembatch_3;
DROP INDEX IF EXISTS public.dk_itembatch_2;
DROP INDEX IF EXISTS public.dk_itembatch_1;
DROP INDEX IF EXISTS public.dk_item_location_1;
DROP INDEX IF EXISTS public.dk_item_3;
DROP INDEX IF EXISTS public.dk_item_2;
DROP INDEX IF EXISTS public.dk_item_1;
DROP INDEX IF EXISTS public.dk_inventory_1;
DROP INDEX IF EXISTS public.dk_dnintake_item_2;
DROP INDEX IF EXISTS public.dk_dnintake_item_1;
DROP INDEX IF EXISTS public.dk_dbintake_item_2;
DROP INDEX IF EXISTS public.dk_dbintake_item_1;
DROP INDEX IF EXISTS public.dk_batchlocation_1;
DROP INDEX IF EXISTS public.dk_aar_status_created;
DROP INDEX IF EXISTS public.dk_aar_audit_req_time;
ALTER TABLE IF EXISTS ONLY public.xfreturn DROP CONSTRAINT IF EXISTS xfreturn_pkey;
ALTER TABLE IF EXISTS ONLY public.warehouse DROP CONSTRAINT IF EXISTS warehouse_pkey;
ALTER TABLE IF EXISTS ONLY public.user_warehouse DROP CONSTRAINT IF EXISTS user_warehouse_pkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_email_key;
ALTER TABLE IF EXISTS ONLY public.permission DROP CONSTRAINT IF EXISTS uq_permission_resource_action;
ALTER TABLE IF EXISTS ONLY public.itemcatg DROP CONSTRAINT IF EXISTS uk_itemcatg_1;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS uk_item_3;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS uk_item_2;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS uk_item_1;
ALTER TABLE IF EXISTS ONLY public.donor DROP CONSTRAINT IF EXISTS uk_donor_1;
ALTER TABLE IF EXISTS ONLY public.custodian DROP CONSTRAINT IF EXISTS uk_custodian_1;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS uk_agency_1;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_pkey;
ALTER TABLE IF EXISTS ONLY public.transfer DROP CONSTRAINT IF EXISTS transfer_pkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_pkey;
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS role_pkey;
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS role_code_key;
ALTER TABLE IF EXISTS ONLY public.reliefpkg DROP CONSTRAINT IF EXISTS reliefpkg_pkey;
ALTER TABLE IF EXISTS ONLY public.relief_request_fulfillment_lock DROP CONSTRAINT IF EXISTS relief_request_fulfillment_lock_pkey;
ALTER TABLE IF EXISTS ONLY public.xfreturn_item DROP CONSTRAINT IF EXISTS pk_xfreturn_item;
ALTER TABLE IF EXISTS ONLY public.xfintake_item DROP CONSTRAINT IF EXISTS pk_xfintake_item;
ALTER TABLE IF EXISTS ONLY public.xfintake DROP CONSTRAINT IF EXISTS pk_xfintake;
ALTER TABLE IF EXISTS ONLY public.unitofmeasure DROP CONSTRAINT IF EXISTS pk_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.transfer_item DROP CONSTRAINT IF EXISTS pk_transfer_item;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS pk_rtintake_item;
ALTER TABLE IF EXISTS ONLY public.rtintake DROP CONSTRAINT IF EXISTS pk_rtintake;
ALTER TABLE IF EXISTS ONLY public.role_permission DROP CONSTRAINT IF EXISTS pk_role_permission;
ALTER TABLE IF EXISTS ONLY public.reliefrqstitem_status DROP CONSTRAINT IF EXISTS pk_reliefrqstitem_status;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_status DROP CONSTRAINT IF EXISTS pk_reliefrqst_status;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_item DROP CONSTRAINT IF EXISTS pk_reliefrqst_item;
ALTER TABLE IF EXISTS ONLY public.reliefrqst DROP CONSTRAINT IF EXISTS pk_reliefrqst;
ALTER TABLE IF EXISTS ONLY public.reliefpkg_item DROP CONSTRAINT IF EXISTS pk_reliefpkg_item;
ALTER TABLE IF EXISTS ONLY public.itemcatg DROP CONSTRAINT IF EXISTS pk_itemcatg;
ALTER TABLE IF EXISTS ONLY public.itembatch DROP CONSTRAINT IF EXISTS pk_itembatch;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS pk_item;
ALTER TABLE IF EXISTS ONLY public.inventory DROP CONSTRAINT IF EXISTS pk_inventory;
ALTER TABLE IF EXISTS ONLY public.event DROP CONSTRAINT IF EXISTS pk_event;
ALTER TABLE IF EXISTS ONLY public.dnintake_item DROP CONSTRAINT IF EXISTS pk_dnintake_item;
ALTER TABLE IF EXISTS ONLY public.custodian DROP CONSTRAINT IF EXISTS pk_custodian;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS pk_batchlocation;
ALTER TABLE IF EXISTS ONLY public.permission DROP CONSTRAINT IF EXISTS permission_pkey;
ALTER TABLE IF EXISTS ONLY public.parish DROP CONSTRAINT IF EXISTS parish_pkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_pkey;
ALTER TABLE IF EXISTS ONLY public.location DROP CONSTRAINT IF EXISTS location_pkey;
ALTER TABLE IF EXISTS ONLY public.item_location DROP CONSTRAINT IF EXISTS item_location_pkey;
ALTER TABLE IF EXISTS ONLY public.donor DROP CONSTRAINT IF EXISTS donor_pkey;
ALTER TABLE IF EXISTS ONLY public.donation DROP CONSTRAINT IF EXISTS donation_pkey;
ALTER TABLE IF EXISTS ONLY public.donation_item DROP CONSTRAINT IF EXISTS donation_item_pkey;
ALTER TABLE IF EXISTS ONLY public.dnintake DROP CONSTRAINT IF EXISTS dnintake_pkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_pkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_package_number_key;
ALTER TABLE IF EXISTS ONLY public.distribution_package_item DROP CONSTRAINT IF EXISTS distribution_package_item_pkey;
ALTER TABLE IF EXISTS ONLY public.dbintake DROP CONSTRAINT IF EXISTS dbintake_pkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_pkey;
ALTER TABLE IF EXISTS ONLY public.country DROP CONSTRAINT IF EXISTS country_pkey;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS agency_pkey;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS agency_account_request_pkey;
ALTER TABLE IF EXISTS ONLY public.agency_account_request_audit DROP CONSTRAINT IF EXISTS agency_account_request_audit_pkey;
ALTER TABLE IF EXISTS public.xfreturn ALTER COLUMN xfreturn_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."user" ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.transfer_request ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.transaction ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.notification ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.distribution_package_item ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.distribution_package ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.xfreturn_xfreturn_id_seq;
DROP TABLE IF EXISTS public.xfreturn_item;
DROP TABLE IF EXISTS public.xfreturn;
DROP TABLE IF EXISTS public.xfintake_item;
DROP TABLE IF EXISTS public.xfintake;
DROP TABLE IF EXISTS public.warehouse;
DROP VIEW IF EXISTS public.v_status4reliefrqst_create;
DROP VIEW IF EXISTS public.v_status4reliefrqst_action;
DROP TABLE IF EXISTS public.user_warehouse;
DROP TABLE IF EXISTS public.user_role;
DROP SEQUENCE IF EXISTS public.user_id_seq;
DROP TABLE IF EXISTS public."user";
DROP TABLE IF EXISTS public.unitofmeasure;
DROP SEQUENCE IF EXISTS public.transfer_request_id_seq;
DROP TABLE IF EXISTS public.transfer_request;
DROP TABLE IF EXISTS public.transfer_item;
DROP TABLE IF EXISTS public.transfer;
DROP SEQUENCE IF EXISTS public.transaction_id_seq;
DROP TABLE IF EXISTS public.transaction;
DROP TABLE IF EXISTS public.rtintake_item;
DROP TABLE IF EXISTS public.rtintake;
DROP TABLE IF EXISTS public.role_permission;
DROP SEQUENCE IF EXISTS public.role_id_seq;
DROP TABLE IF EXISTS public.role;
DROP TABLE IF EXISTS public.reliefrqstitem_status;
DROP TABLE IF EXISTS public.reliefrqst_status;
DROP TABLE IF EXISTS public.reliefrqst_item;
DROP TABLE IF EXISTS public.reliefrqst;
DROP TABLE IF EXISTS public.reliefpkg_item;
DROP TABLE IF EXISTS public.reliefpkg;
DROP TABLE IF EXISTS public.relief_request_fulfillment_lock;
DROP TABLE IF EXISTS public.permission;
DROP TABLE IF EXISTS public.parish;
DROP SEQUENCE IF EXISTS public.notification_id_seq;
DROP TABLE IF EXISTS public.notification;
DROP TABLE IF EXISTS public.location;
DROP TABLE IF EXISTS public.itemcatg;
DROP TABLE IF EXISTS public.itembatch;
DROP TABLE IF EXISTS public.item_location;
DROP TABLE IF EXISTS public.item;
DROP TABLE IF EXISTS public.inventory;
DROP TABLE IF EXISTS public.event;
DROP TABLE IF EXISTS public.donor;
DROP TABLE IF EXISTS public.donation_item;
DROP TABLE IF EXISTS public.donation;
DROP TABLE IF EXISTS public.dnintake_item;
DROP TABLE IF EXISTS public.dnintake;
DROP SEQUENCE IF EXISTS public.distribution_package_item_id_seq;
DROP TABLE IF EXISTS public.distribution_package_item;
DROP SEQUENCE IF EXISTS public.distribution_package_id_seq;
DROP TABLE IF EXISTS public.distribution_package;
DROP TABLE IF EXISTS public.dbintake_item;
DROP TABLE IF EXISTS public.dbintake;
DROP TABLE IF EXISTS public.custodian;
DROP TABLE IF EXISTS public.country;
DROP TABLE IF EXISTS public.batchlocation;
DROP TABLE IF EXISTS public.agency_account_request_audit;
DROP TABLE IF EXISTS public.agency_account_request;
DROP TABLE IF EXISTS public.agency;
DROP FUNCTION IF EXISTS public.set_updated_at();
DROP EXTENSION IF EXISTS pgcrypto;
DROP EXTENSION IF EXISTS citext;
--
-- TOC entry 2 (class 3079 OID 24576)
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- TOC entry 3 (class 3079 OID 81920)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 295 (class 1255 OID 40980)
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.update_dtime := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 24807)
-- Name: agency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agency (
    agency_id integer NOT NULL,
    agency_name character varying(120) NOT NULL,
    address1_text character varying(255) NOT NULL,
    address2_text character varying(255),
    parish_code character(2) NOT NULL,
    contact_name character varying(50) NOT NULL,
    phone_no character varying(20) NOT NULL,
    email_text character varying(100),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    agency_type character varying(16) NOT NULL,
    ineligible_event_id integer,
    status_code character(1) NOT NULL,
    warehouse_id integer,
    CONSTRAINT agency_agency_name_check CHECK (((agency_name)::text = upper((agency_name)::text))),
    CONSTRAINT agency_contact_name_check CHECK (((contact_name)::text = upper((contact_name)::text))),
    CONSTRAINT c_agency_3 CHECK (((agency_type)::text = ANY ((ARRAY['DISTRIBUTOR'::character varying, 'SHELTER'::character varying])::text[]))),
    CONSTRAINT c_agency_5 CHECK (((((agency_type)::text = 'SHELTER'::text) AND (warehouse_id IS NULL)) OR (((agency_type)::text <> 'SHELTER'::text) AND (warehouse_id IS NOT NULL)))),
    CONSTRAINT c_agency_6 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar])))
);


--
-- TOC entry 268 (class 1259 OID 49153)
-- Name: agency_account_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agency_account_request (
    request_id integer NOT NULL,
    agency_name character varying(120) NOT NULL,
    contact_name character varying(80) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    contact_email public.citext NOT NULL,
    reason_text character varying(255) NOT NULL,
    agency_id integer,
    user_id integer,
    status_code character(1) NOT NULL,
    status_reason character varying(255),
    created_by_id integer NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_by_id integer NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_aar_status CHECK ((status_code = ANY (ARRAY['S'::bpchar, 'R'::bpchar, 'A'::bpchar, 'D'::bpchar])))
);


--
-- TOC entry 270 (class 1259 OID 49188)
-- Name: agency_account_request_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agency_account_request_audit (
    audit_id integer NOT NULL,
    request_id integer NOT NULL,
    event_type character varying(24) NOT NULL,
    event_notes character varying(255),
    actor_user_id integer NOT NULL,
    event_dtime timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 49187)
-- Name: agency_account_request_audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.agency_account_request_audit ALTER COLUMN audit_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agency_account_request_audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 267 (class 1259 OID 49152)
-- Name: agency_account_request_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.agency_account_request ALTER COLUMN request_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agency_account_request_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 24806)
-- Name: agency_agency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.agency ALTER COLUMN agency_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agency_agency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 288 (class 1259 OID 188484)
-- Name: batchlocation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.batchlocation (
    inventory_id integer NOT NULL,
    location_id integer NOT NULL,
    batch_id integer NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 24681)
-- Name: country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country (
    country_id smallint NOT NULL,
    country_name character varying(80) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 24740)
-- Name: custodian; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custodian (
    custodian_id integer NOT NULL,
    custodian_name character varying(120) DEFAULT 'OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)'::character varying NOT NULL,
    address1_text character varying(255) NOT NULL,
    address2_text character varying(255),
    parish_code character(2) NOT NULL,
    contact_name character varying(50) NOT NULL,
    phone_no character varying(20) NOT NULL,
    email_text character varying(100),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_custodian_1 CHECK (((custodian_name)::text = upper((custodian_name)::text))),
    CONSTRAINT c_custodian_3 CHECK (((contact_name)::text = upper((contact_name)::text)))
);


--
-- TOC entry 222 (class 1259 OID 24739)
-- Name: custodian_custodian_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.custodian ALTER COLUMN custodian_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.custodian_custodian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 25123)
-- Name: dbintake; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dbintake (
    reliefpkg_id integer NOT NULL,
    inventory_id integer NOT NULL,
    intake_date date NOT NULL,
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT dbintake_intake_date_check CHECK ((intake_date <= CURRENT_DATE)),
    CONSTRAINT dbintake_status_code_check CHECK ((status_code = ANY (ARRAY['I'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- TOC entry 243 (class 1259 OID 25140)
-- Name: dbintake_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dbintake_item (
    reliefpkg_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    location1_id integer,
    defective_qty numeric(12,2) NOT NULL,
    location2_id integer,
    expired_qty numeric(12,2) NOT NULL,
    location3_id integer,
    uom_code character varying(25) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT dbintake_item_defective_qty_check CHECK ((defective_qty >= 0.00)),
    CONSTRAINT dbintake_item_expired_qty_check CHECK ((expired_qty >= 0.00)),
    CONSTRAINT dbintake_item_status_code_check CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar]))),
    CONSTRAINT dbintake_item_usable_qty_check CHECK ((usable_qty >= 0.00))
);


--
-- TOC entry 245 (class 1259 OID 25360)
-- Name: distribution_package; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.distribution_package (
    id integer NOT NULL,
    package_number character varying(64) NOT NULL,
    recipient_agency_id integer NOT NULL,
    assigned_warehouse_id integer,
    event_id integer,
    status character varying(50) DEFAULT 'Draft'::character varying NOT NULL,
    is_partial boolean DEFAULT false NOT NULL,
    created_by character varying(200) NOT NULL,
    approved_by character varying(200),
    approved_at timestamp without time zone,
    dispatched_by character varying(200),
    dispatched_at timestamp without time zone,
    delivered_at timestamp without time zone,
    notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 25359)
-- Name: distribution_package_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.distribution_package_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 244
-- Name: distribution_package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.distribution_package_id_seq OWNED BY public.distribution_package.id;


--
-- TOC entry 247 (class 1259 OID 25393)
-- Name: distribution_package_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.distribution_package_item (
    id integer NOT NULL,
    package_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(12,2) NOT NULL,
    notes text
);


--
-- TOC entry 246 (class 1259 OID 25392)
-- Name: distribution_package_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.distribution_package_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 246
-- Name: distribution_package_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.distribution_package_item_id_seq OWNED BY public.distribution_package_item.id;


--
-- TOC entry 235 (class 1259 OID 24935)
-- Name: dnintake; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dnintake (
    donation_id integer NOT NULL,
    inventory_id integer NOT NULL,
    intake_date date NOT NULL,
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT dnintake_intake_date_check CHECK ((intake_date <= CURRENT_DATE)),
    CONSTRAINT dnintake_status_code_check CHECK ((status_code = ANY (ARRAY['I'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- TOC entry 289 (class 1259 OID 188511)
-- Name: dnintake_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dnintake_item (
    donation_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    batch_no character varying(20) NOT NULL,
    batch_date date NOT NULL,
    expiry_date date,
    uom_code character varying(25) NOT NULL,
    avg_unit_value numeric(10,2) NOT NULL,
    usable_qty numeric(15,4) NOT NULL,
    defective_qty numeric(15,4) NOT NULL,
    expired_qty numeric(15,4) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_dnintake_item_1a CHECK (((batch_no)::text = upper((batch_no)::text))),
    CONSTRAINT c_dnintake_item_1b CHECK ((batch_date <= CURRENT_DATE)),
    CONSTRAINT c_dnintake_item_1d CHECK ((avg_unit_value >= 0.00)),
    CONSTRAINT c_dnintake_item_2 CHECK ((usable_qty >= 0.00)),
    CONSTRAINT c_dnintake_item_3 CHECK ((defective_qty >= 0.00)),
    CONSTRAINT c_dnintake_item_4 CHECK ((expired_qty >= 0.00)),
    CONSTRAINT c_dnintake_item_5 CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar])))
);


--
-- TOC entry 233 (class 1259 OID 24887)
-- Name: donation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donation (
    donation_id integer NOT NULL,
    donor_id integer NOT NULL,
    donation_desc text NOT NULL,
    event_id integer NOT NULL,
    custodian_id integer NOT NULL,
    received_date date NOT NULL,
    status_code character(1) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT donation_received_date_check CHECK ((received_date <= CURRENT_DATE)),
    CONSTRAINT donation_status_code_check CHECK ((status_code = ANY (ARRAY['E'::bpchar, 'V'::bpchar])))
);


--
-- TOC entry 232 (class 1259 OID 24886)
-- Name: donation_donation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.donation ALTER COLUMN donation_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.donation_donation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 24911)
-- Name: donation_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donation_item (
    donation_id integer NOT NULL,
    item_id integer NOT NULL,
    item_qty numeric(12,2) NOT NULL,
    uom_code character varying(25) NOT NULL,
    location_name text NOT NULL,
    status_code character(1) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT donation_item_item_qty_check CHECK ((item_qty >= 0.00)),
    CONSTRAINT donation_item_status_code_check CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar])))
);


--
-- TOC entry 221 (class 1259 OID 24722)
-- Name: donor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donor (
    donor_id integer NOT NULL,
    donor_type character(1) NOT NULL,
    donor_name character varying(255) NOT NULL,
    org_type_desc character varying(30),
    address1_text character varying(255) NOT NULL,
    address2_text character varying(255),
    country_id smallint DEFAULT 388 NOT NULL,
    phone_no character varying(20) NOT NULL,
    email_text character varying(100),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT donor_donor_name_check CHECK (((donor_name)::text = upper((donor_name)::text))),
    CONSTRAINT donor_donor_type_check CHECK ((donor_type = ANY (ARRAY['I'::bpchar, 'O'::bpchar])))
);


--
-- TOC entry 220 (class 1259 OID 24721)
-- Name: donor_donor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.donor ALTER COLUMN donor_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.donor_donor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 281 (class 1259 OID 114689)
-- Name: event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event (
    event_id integer NOT NULL,
    event_type character varying(16) NOT NULL,
    start_date date NOT NULL,
    event_name character varying(60) NOT NULL,
    event_desc character varying(255) NOT NULL,
    impact_desc text NOT NULL,
    status_code character(1) NOT NULL,
    closed_date date,
    reason_desc character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_event_1 CHECK (((event_type)::text = ANY ((ARRAY['STORM'::character varying, 'TORNADO'::character varying, 'FLOOD'::character varying, 'TSUNAMI'::character varying, 'FIRE'::character varying, 'EARTHQUAKE'::character varying, 'WAR'::character varying, 'EPIDEMIC'::character varying])::text[]))),
    CONSTRAINT c_event_2 CHECK ((start_date <= CURRENT_DATE)),
    CONSTRAINT c_event_3 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'C'::bpchar]))),
    CONSTRAINT c_event_4a CHECK ((((status_code = 'A'::bpchar) AND (closed_date IS NULL)) OR ((status_code = 'C'::bpchar) AND (closed_date IS NOT NULL)))),
    CONSTRAINT c_event_4b CHECK ((((reason_desc IS NULL) AND (closed_date IS NULL)) OR ((reason_desc IS NOT NULL) AND (closed_date IS NOT NULL))))
);


--
-- TOC entry 280 (class 1259 OID 114688)
-- Name: event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.event ALTER COLUMN event_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.event_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 24824)
-- Name: inventory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    reserved_qty numeric(12,2) NOT NULL,
    defective_qty numeric(12,2) NOT NULL,
    expired_qty numeric(12,2) NOT NULL,
    uom_code character varying(25) NOT NULL,
    last_verified_by character varying(20),
    last_verified_date date,
    status_code character(1) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    reorder_qty numeric(12,2) DEFAULT 0.00 NOT NULL,
    CONSTRAINT c_inventory_1 CHECK ((usable_qty >= 0.00)),
    CONSTRAINT c_inventory_2 CHECK ((reserved_qty <= usable_qty)),
    CONSTRAINT c_inventory_3 CHECK ((defective_qty >= 0.00)),
    CONSTRAINT c_inventory_4 CHECK ((expired_qty >= 0.00)),
    CONSTRAINT c_inventory_5 CHECK ((reorder_qty >= 0.00)),
    CONSTRAINT c_inventory_6 CHECK ((((last_verified_by IS NULL) AND (last_verified_date IS NULL)) OR ((last_verified_by IS NOT NULL) AND (last_verified_date IS NOT NULL)))),
    CONSTRAINT c_inventory_7 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'U'::bpchar])))
);


--
-- TOC entry 285 (class 1259 OID 172070)
-- Name: item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item (
    item_id integer NOT NULL,
    item_code character varying(16) NOT NULL,
    item_name character varying(60) NOT NULL,
    sku_code character varying(30) NOT NULL,
    category_id integer NOT NULL,
    item_desc public.citext NOT NULL,
    reorder_qty numeric(12,2) NOT NULL,
    default_uom_code character varying(25) NOT NULL,
    units_size_vary_flag boolean DEFAULT false NOT NULL,
    usage_desc text,
    storage_desc text,
    is_batched_flag boolean DEFAULT true NOT NULL,
    can_expire_flag boolean DEFAULT false NOT NULL,
    issuance_order character varying(20) DEFAULT 'FIFO'::character varying NOT NULL,
    comments_text text,
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_item_1a CHECK (((item_code)::text = upper((item_code)::text))),
    CONSTRAINT c_item_1b CHECK (((item_name)::text = upper((item_name)::text))),
    CONSTRAINT c_item_1c CHECK (((sku_code)::text = upper((sku_code)::text))),
    CONSTRAINT c_item_1d CHECK ((reorder_qty > 0.00)),
    CONSTRAINT c_item_3 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar])))
);


--
-- TOC entry 231 (class 1259 OID 24870)
-- Name: item_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_location (
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    location_id integer NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL
);


--
-- TOC entry 284 (class 1259 OID 172069)
-- Name: item_new_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.item ALTER COLUMN item_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.item_new_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 287 (class 1259 OID 188417)
-- Name: itembatch; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.itembatch (
    batch_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    batch_no character varying(20) NOT NULL,
    batch_date date NOT NULL,
    expiry_date date,
    usable_qty numeric(15,4) NOT NULL,
    reserved_qty numeric(15,4) DEFAULT 0 NOT NULL,
    defective_qty numeric(15,4) DEFAULT 0 NOT NULL,
    expired_qty numeric(15,4) DEFAULT 0 NOT NULL,
    uom_code character varying(25) NOT NULL,
    size_spec character varying(30),
    avg_unit_value numeric(10,2) DEFAULT 0.00 NOT NULL,
    last_verified_by character varying(20),
    last_verified_date date,
    status_code character(1) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_itembatch_1 CHECK (((batch_no)::text = upper((batch_no)::text))),
    CONSTRAINT c_itembatch_2a CHECK ((usable_qty >= 0.00)),
    CONSTRAINT c_itembatch_2b CHECK (((reserved_qty <= usable_qty) AND (reserved_qty >= 0.00))),
    CONSTRAINT c_itembatch_2c CHECK ((defective_qty >= 0.00)),
    CONSTRAINT c_itembatch_2d CHECK ((expired_qty >= 0.00)),
    CONSTRAINT c_itembatch_3 CHECK ((avg_unit_value >= 0.00)),
    CONSTRAINT c_itembatch_5 CHECK ((((last_verified_by IS NULL) AND (last_verified_date IS NULL)) OR ((last_verified_by IS NOT NULL) AND (last_verified_date IS NOT NULL)))),
    CONSTRAINT c_itembatch_6 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'U'::bpchar])))
);


--
-- TOC entry 286 (class 1259 OID 188416)
-- Name: itembatch_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.itembatch ALTER COLUMN batch_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.itembatch_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 283 (class 1259 OID 131093)
-- Name: itemcatg; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.itemcatg (
    category_id integer NOT NULL,
    category_code character varying(30) NOT NULL,
    category_desc character varying(60) NOT NULL,
    comments_text text,
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_itemcatg_1 CHECK (((category_code)::text = upper((category_code)::text))),
    CONSTRAINT c_itemcatg_2 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar])))
);


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE itemcatg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.itemcatg IS 'Item Category master data table - defines categories for relief items';


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN itemcatg.category_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.category_id IS 'Primary key - auto-generated category identifier';


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN itemcatg.category_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.category_code IS 'Unique category code (uppercase) - business key';


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN itemcatg.category_desc; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.category_desc IS 'Description of the item category';


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN itemcatg.comments_text; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.comments_text IS 'Additional comments or notes about this category';


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN itemcatg.status_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.status_code IS 'Status: A=Active, I=Inactive';


--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN itemcatg.version_nbr; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.version_nbr IS 'Optimistic locking version number';


--
-- TOC entry 282 (class 1259 OID 131092)
-- Name: itemcatg_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.itemcatg ALTER COLUMN category_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.itemcatg_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 24856)
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    inventory_id integer NOT NULL,
    location_desc character varying(255) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT location_status_code_check CHECK ((status_code = ANY (ARRAY['O'::bpchar, 'C'::bpchar])))
);


--
-- TOC entry 229 (class 1259 OID 24855)
-- Name: location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.location ALTER COLUMN location_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.location_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 255 (class 1259 OID 25501)
-- Name: notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification (
    id integer NOT NULL,
    user_id integer NOT NULL,
    warehouse_id integer,
    reliefrqst_id integer,
    title character varying(200) NOT NULL,
    message text NOT NULL,
    type character varying(50) NOT NULL,
    status character varying(20) DEFAULT 'unread'::character varying NOT NULL,
    link_url character varying(500),
    payload text,
    is_archived boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 25500)
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 254
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- TOC entry 218 (class 1259 OID 24686)
-- Name: parish; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parish (
    parish_code character(2) NOT NULL,
    parish_name character varying(40) NOT NULL,
    CONSTRAINT parish_parish_code_check CHECK (((parish_code ~ similar_to_escape('[0-9]*'::text)) AND (((parish_code)::integer >= 1) AND ((parish_code)::integer <= 14))))
);


--
-- TOC entry 273 (class 1259 OID 65562)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permission (
    perm_id integer NOT NULL,
    resource character varying(40) NOT NULL,
    action character varying(32) NOT NULL,
    create_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    create_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    update_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    update_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 272 (class 1259 OID 65561)
-- Name: permission_perm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.permission ALTER COLUMN perm_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.permission_perm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 279 (class 1259 OID 106496)
-- Name: relief_request_fulfillment_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.relief_request_fulfillment_lock (
    reliefrqst_id integer NOT NULL,
    fulfiller_user_id integer NOT NULL,
    fulfiller_email character varying(100) NOT NULL,
    acquired_at timestamp without time zone DEFAULT now() NOT NULL,
    expires_at timestamp without time zone,
    CONSTRAINT chk_expires_after_acquired CHECK (((expires_at IS NULL) OR (expires_at > acquired_at)))
);


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE relief_request_fulfillment_lock; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.relief_request_fulfillment_lock IS 'Tracks which user is currently preparing/packaging a relief request to ensure single fulfiller';


--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN relief_request_fulfillment_lock.expires_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.relief_request_fulfillment_lock.expires_at IS 'Optional expiry time for automatic lock release';


--
-- TOC entry 241 (class 1259 OID 25077)
-- Name: reliefpkg; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefpkg (
    reliefpkg_id integer NOT NULL,
    to_inventory_id integer NOT NULL,
    reliefrqst_id integer NOT NULL,
    start_date date DEFAULT CURRENT_DATE NOT NULL,
    dispatch_dtime timestamp(0) without time zone,
    transport_mode character varying(255),
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    received_by_id character varying(20) NOT NULL,
    received_dtime timestamp(0) without time zone,
    CONSTRAINT c_reliefpkg_2 CHECK ((((dispatch_dtime IS NULL) AND (status_code <> 'D'::bpchar)) OR ((dispatch_dtime IS NOT NULL) AND (status_code = 'D'::bpchar)))),
    CONSTRAINT c_reliefpkg_3 CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'C'::bpchar, 'V'::bpchar, 'D'::bpchar, 'R'::bpchar]))),
    CONSTRAINT reliefpkg_start_date_check CHECK ((start_date <= CURRENT_DATE))
);


--
-- TOC entry 291 (class 1259 OID 204801)
-- Name: reliefpkg_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefpkg_item (
    reliefpkg_id integer NOT NULL,
    fr_inventory_id integer NOT NULL,
    batch_id integer NOT NULL,
    item_id integer NOT NULL,
    item_qty numeric(15,4) NOT NULL,
    uom_code character varying(25) NOT NULL,
    reason_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_reliefpkg_item_1 CHECK ((item_qty >= 0.00))
);


--
-- TOC entry 240 (class 1259 OID 25076)
-- Name: reliefpkg_reliefpkg_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reliefpkg ALTER COLUMN reliefpkg_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reliefpkg_reliefpkg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 25029)
-- Name: reliefrqst; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefrqst (
    reliefrqst_id integer NOT NULL,
    agency_id integer NOT NULL,
    request_date date NOT NULL,
    urgency_ind character(1) NOT NULL,
    status_code smallint DEFAULT 0 NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    review_by_id character varying(20),
    review_dtime timestamp(0) without time zone,
    action_by_id character varying(20),
    action_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    eligible_event_id integer,
    rqst_notes_text text,
    review_notes_text text,
    tracking_no character varying(7) DEFAULT upper(substr(replace((gen_random_uuid())::text, '-'::text, ''::text), 1, 7)) NOT NULL,
    status_reason_desc character varying(255),
    receive_by_id character varying(20),
    receive_dtime timestamp(0) without time zone,
    CONSTRAINT c_reliefrqst_1 CHECK ((request_date <= CURRENT_DATE)),
    CONSTRAINT c_reliefrqst_2 CHECK ((urgency_ind = ANY (ARRAY['L'::bpchar, 'M'::bpchar, 'H'::bpchar, 'C'::bpchar]))),
    CONSTRAINT c_reliefrqst_3 CHECK (((status_reason_desc IS NOT NULL) OR ((status_reason_desc IS NULL) AND (status_code <> ALL (ARRAY[4, 6, 8]))))),
    CONSTRAINT c_reliefrqst_4a CHECK ((((review_by_id IS NULL) AND (status_code < 2)) OR ((review_by_id IS NOT NULL) AND (status_code >= 2)))),
    CONSTRAINT c_reliefrqst_4b CHECK ((((review_by_id IS NULL) AND (review_dtime IS NULL)) OR ((review_by_id IS NOT NULL) AND (review_dtime IS NOT NULL)))),
    CONSTRAINT c_reliefrqst_5a CHECK ((((action_by_id IS NULL) AND (status_code < 4)) OR ((action_by_id IS NOT NULL) AND (status_code >= 4)))),
    CONSTRAINT c_reliefrqst_5b CHECK ((((action_by_id IS NULL) AND (action_dtime IS NULL)) OR ((action_by_id IS NOT NULL) AND (action_dtime IS NOT NULL)))),
    CONSTRAINT c_reliefrqst_6a CHECK ((((receive_by_id IS NULL) AND (status_code <> 9)) OR ((receive_by_id IS NOT NULL) AND (status_code = 9)))),
    CONSTRAINT c_reliefrqst_6b CHECK ((((receive_by_id IS NULL) AND (receive_dtime IS NULL)) OR ((receive_by_id IS NOT NULL) AND (receive_dtime IS NOT NULL))))
);


--
-- TOC entry 275 (class 1259 OID 90113)
-- Name: reliefrqst_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefrqst_item (
    reliefrqst_id integer NOT NULL,
    item_id integer NOT NULL,
    request_qty numeric(12,2) NOT NULL,
    issue_qty numeric(12,2) DEFAULT 0.00 NOT NULL,
    urgency_ind character(1) NOT NULL,
    rqst_reason_desc character varying(255),
    required_by_date date,
    status_code character(1) DEFAULT 'R'::bpchar NOT NULL,
    status_reason_desc character varying(255),
    action_by_id character varying(20),
    action_dtime timestamp(0) without time zone,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_reliefrqst_item_1 CHECK ((request_qty > 0.00)),
    CONSTRAINT c_reliefrqst_item_2a CHECK ((((status_code = ANY (ARRAY['R'::bpchar, 'U'::bpchar, 'W'::bpchar, 'D'::bpchar])) AND (issue_qty = (0)::numeric)) OR ((status_code = ANY (ARRAY['P'::bpchar, 'L'::bpchar])) AND (issue_qty < request_qty)) OR ((status_code = 'F'::bpchar) AND (issue_qty = request_qty)))),
    CONSTRAINT c_reliefrqst_item_3 CHECK ((urgency_ind = ANY (ARRAY['L'::bpchar, 'M'::bpchar, 'H'::bpchar, 'C'::bpchar]))),
    CONSTRAINT c_reliefrqst_item_4 CHECK (((urgency_ind = ANY (ARRAY['L'::bpchar, 'M'::bpchar, 'C'::bpchar])) OR ((urgency_ind = 'H'::bpchar) AND (rqst_reason_desc IS NOT NULL) AND (TRIM(BOTH FROM rqst_reason_desc) <> ''::text)))),
    CONSTRAINT c_reliefrqst_item_5 CHECK (((required_by_date IS NOT NULL) OR ((required_by_date IS NULL) AND (urgency_ind = ANY (ARRAY['L'::bpchar, 'M'::bpchar]))))),
    CONSTRAINT c_reliefrqst_item_6a CHECK ((status_code = ANY (ARRAY['R'::bpchar, 'U'::bpchar, 'W'::bpchar, 'D'::bpchar, 'P'::bpchar, 'L'::bpchar, 'F'::bpchar]))),
    CONSTRAINT c_reliefrqst_item_6b CHECK (((status_reason_desc IS NOT NULL) OR ((status_reason_desc IS NULL) AND (status_code <> ALL (ARRAY['D'::bpchar, 'L'::bpchar]))))),
    CONSTRAINT c_reliefrqst_item_7 CHECK ((((action_by_id IS NULL) AND (status_code = 'R'::bpchar)) OR ((action_by_id IS NOT NULL) AND (status_code <> 'R'::bpchar)))),
    CONSTRAINT c_reliefrqst_item_8 CHECK ((((action_by_id IS NULL) AND (action_dtime IS NULL)) OR ((action_by_id IS NOT NULL) AND (action_dtime IS NOT NULL))))
);


--
-- TOC entry 238 (class 1259 OID 25028)
-- Name: reliefrqst_reliefrqst_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reliefrqst ALTER COLUMN reliefrqst_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reliefrqst_reliefrqst_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 271 (class 1259 OID 57344)
-- Name: reliefrqst_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefrqst_status (
    status_code smallint NOT NULL,
    status_desc character varying(20) NOT NULL,
    is_active_flag boolean DEFAULT true NOT NULL,
    reason_rqrd_flag boolean DEFAULT false NOT NULL
);


--
-- TOC entry 276 (class 1259 OID 98304)
-- Name: reliefrqstitem_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefrqstitem_status (
    status_code character(1) NOT NULL,
    status_desc character varying(30) NOT NULL,
    item_qty_rule character(2) NOT NULL,
    active_flag boolean DEFAULT true NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_reliefrqstitem_status_2 CHECK ((item_qty_rule = ANY (ARRAY['EZ'::bpchar, 'GZ'::bpchar, 'ER'::bpchar])))
);


--
-- TOC entry 251 (class 1259 OID 25446)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 25445)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 250
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 274 (class 1259 OID 65574)
-- Name: role_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_permission (
    role_id integer NOT NULL,
    perm_id integer NOT NULL,
    scope_json jsonb,
    create_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    create_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    update_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    update_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 32867)
-- Name: rtintake; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rtintake (
    xfreturn_id integer NOT NULL,
    inventory_id integer NOT NULL,
    intake_date date NOT NULL,
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT rtintake_intake_date_check CHECK ((intake_date <= CURRENT_DATE)),
    CONSTRAINT rtintake_status_code_check CHECK ((status_code = ANY (ARRAY['I'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- TOC entry 266 (class 1259 OID 32884)
-- Name: rtintake_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rtintake_item (
    xfreturn_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    location1_id integer,
    defective_qty numeric(12,2) NOT NULL,
    location2_id integer,
    expired_qty numeric(12,2) NOT NULL,
    location3_id integer,
    uom_code character varying(25) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT rtintake_item_defective_qty_check CHECK ((defective_qty >= 0.00)),
    CONSTRAINT rtintake_item_expired_qty_check CHECK ((expired_qty >= 0.00)),
    CONSTRAINT rtintake_item_status_code_check CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar]))),
    CONSTRAINT rtintake_item_usable_qty_check CHECK ((usable_qty >= 0.00))
);


--
-- TOC entry 259 (class 1259 OID 25566)
-- Name: transaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    item_id integer,
    ttype character varying(8) NOT NULL,
    qty numeric(12,2) NOT NULL,
    warehouse_id integer,
    donor_id integer,
    event_id integer,
    expiry_date date,
    notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(200)
);


--
-- TOC entry 258 (class 1259 OID 25565)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 258
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- TOC entry 237 (class 1259 OID 24989)
-- Name: transfer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transfer (
    transfer_id integer NOT NULL,
    fr_inventory_id integer NOT NULL,
    to_inventory_id integer NOT NULL,
    transfer_date date DEFAULT CURRENT_DATE NOT NULL,
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    event_id integer,
    reason_text character varying(255),
    CONSTRAINT c_transfer_2 CHECK ((status_code = ANY (ARRAY['D'::bpchar, 'C'::bpchar, 'V'::bpchar]))),
    CONSTRAINT transfer_transfer_date_check CHECK ((transfer_date <= CURRENT_DATE))
);


--
-- TOC entry 290 (class 1259 OID 196608)
-- Name: transfer_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transfer_item (
    transfer_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    batch_id integer NOT NULL,
    item_qty numeric(15,4) NOT NULL,
    uom_code character varying(25) NOT NULL,
    reason_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_transfer_item_1 CHECK ((item_qty >= 0.00))
);


--
-- TOC entry 257 (class 1259 OID 25530)
-- Name: transfer_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transfer_request (
    id integer NOT NULL,
    from_warehouse_id integer NOT NULL,
    to_warehouse_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(12,2) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    requested_by integer,
    requested_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    reviewed_by integer,
    reviewed_at timestamp without time zone,
    notes text
);


--
-- TOC entry 256 (class 1259 OID 25529)
-- Name: transfer_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transfer_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 256
-- Name: transfer_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transfer_request_id_seq OWNED BY public.transfer_request.id;


--
-- TOC entry 236 (class 1259 OID 24988)
-- Name: transfer_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.transfer ALTER COLUMN transfer_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.transfer_transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 24692)
-- Name: unitofmeasure; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitofmeasure (
    uom_code character varying(25) NOT NULL,
    uom_desc character varying(60) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    status_code character(1) DEFAULT 'A'::bpchar NOT NULL,
    CONSTRAINT c_unitofmeasure_1 CHECK (((uom_code)::text = upper((uom_code)::text))),
    CONSTRAINT c_unitofmeasure_2 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar])))
);


--
-- TOC entry 249 (class 1259 OID 25414)
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    email character varying(200) NOT NULL,
    password_hash character varying(256) NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    full_name character varying(200),
    is_active boolean DEFAULT true NOT NULL,
    organization character varying(200),
    job_title character varying(200),
    phone character varying(50),
    timezone character varying(50) DEFAULT 'America/Jamaica'::character varying NOT NULL,
    language character varying(10) DEFAULT 'en'::character varying NOT NULL,
    notification_preferences text,
    assigned_warehouse_id integer,
    last_login_at timestamp without time zone,
    create_dtime timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_dtime timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    username character varying(60),
    password_algo character varying(20) DEFAULT 'argon2id'::character varying NOT NULL,
    mfa_enabled boolean DEFAULT false NOT NULL,
    mfa_secret character varying(64),
    failed_login_count smallint DEFAULT 0 NOT NULL,
    lock_until_at timestamp(0) without time zone,
    password_changed_at timestamp(0) without time zone,
    agency_id integer,
    status_code character(1) DEFAULT 'A'::bpchar NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    user_name character varying(20) NOT NULL,
    CONSTRAINT c_user_status_code CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar, 'L'::bpchar])))
);


--
-- TOC entry 248 (class 1259 OID 25413)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".user_id;


--
-- TOC entry 252 (class 1259 OID 25458)
-- Name: user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    assigned_by integer,
    create_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    create_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    update_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    update_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 253 (class 1259 OID 25479)
-- Name: user_warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_warehouse (
    user_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    assigned_by integer
);


--
-- TOC entry 278 (class 1259 OID 98321)
-- Name: v_status4reliefrqst_action; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_status4reliefrqst_action AS
 SELECT status_code,
    status_desc,
    reason_rqrd_flag
   FROM public.reliefrqst_status
  WHERE ((status_code = ANY (ARRAY[4, 5, 6, 7, 8])) AND (is_active_flag = true));


--
-- TOC entry 277 (class 1259 OID 98317)
-- Name: v_status4reliefrqst_create; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_status4reliefrqst_create AS
 SELECT status_code,
    status_desc,
    reason_rqrd_flag
   FROM public.reliefrqst_status
  WHERE ((status_code = ANY (ARRAY[0, 1, 2, 3])) AND (is_active_flag = true));


--
-- TOC entry 225 (class 1259 OID 24785)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.warehouse (
    warehouse_id integer NOT NULL,
    warehouse_name text NOT NULL,
    warehouse_type character varying(10) NOT NULL,
    address1_text character varying(255) NOT NULL,
    address2_text character varying(255),
    parish_code character(2) NOT NULL,
    contact_name character varying(50) NOT NULL,
    phone_no character varying(20) NOT NULL,
    email_text character varying(100),
    custodian_id integer NOT NULL,
    status_code character(1) NOT NULL,
    reason_desc character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT warehouse_check CHECK ((((reason_desc IS NULL) AND (status_code = 'A'::bpchar)) OR ((reason_desc IS NOT NULL) AND (status_code = 'I'::bpchar)))),
    CONSTRAINT warehouse_contact_name_check CHECK (((contact_name)::text = upper((contact_name)::text))),
    CONSTRAINT warehouse_status_code_check CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar]))),
    CONSTRAINT warehouse_warehouse_type_check CHECK (((warehouse_type)::text = ANY ((ARRAY['MAIN-HUB'::character varying, 'SUB-HUB'::character varying])::text[])))
);


--
-- TOC entry 224 (class 1259 OID 24784)
-- Name: warehouse_warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.warehouse ALTER COLUMN warehouse_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.warehouse_warehouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 32768)
-- Name: xfintake; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xfintake (
    transfer_id integer NOT NULL,
    inventory_id integer NOT NULL,
    intake_date date NOT NULL,
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT xfintake_intake_date_check CHECK ((intake_date <= CURRENT_DATE)),
    CONSTRAINT xfintake_status_code_check CHECK ((status_code = ANY (ARRAY['I'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- TOC entry 261 (class 1259 OID 32785)
-- Name: xfintake_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xfintake_item (
    transfer_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    location1_id integer,
    defective_qty numeric(12,2) NOT NULL,
    location2_id integer,
    expired_qty numeric(12,2) NOT NULL,
    location3_id integer,
    uom_code character varying(25) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT xfintake_item_defective_qty_check CHECK ((defective_qty >= 0.00)),
    CONSTRAINT xfintake_item_expired_qty_check CHECK ((expired_qty >= 0.00)),
    CONSTRAINT xfintake_item_status_code_check CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar]))),
    CONSTRAINT xfintake_item_usable_qty_check CHECK ((usable_qty >= 0.00))
);


--
-- TOC entry 263 (class 1259 OID 32822)
-- Name: xfreturn; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xfreturn (
    xfreturn_id integer NOT NULL,
    fr_inventory_id integer NOT NULL,
    to_inventory_id integer NOT NULL,
    return_date date DEFAULT CURRENT_DATE NOT NULL,
    reason_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT xfreturn_return_date_check CHECK ((return_date <= CURRENT_DATE)),
    CONSTRAINT xfreturn_status_code_check CHECK ((status_code = ANY (ARRAY['D'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- TOC entry 264 (class 1259 OID 32844)
-- Name: xfreturn_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xfreturn_item (
    xfreturn_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    defective_qty numeric(12,2) NOT NULL,
    expired_qty numeric(12,2) NOT NULL,
    uom_code character varying(25) NOT NULL,
    reason_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT xfreturn_item_defective_qty_check CHECK ((defective_qty >= 0.00)),
    CONSTRAINT xfreturn_item_expired_qty_check CHECK ((expired_qty >= 0.00)),
    CONSTRAINT xfreturn_item_usable_qty_check CHECK ((usable_qty >= 0.00))
);


--
-- TOC entry 262 (class 1259 OID 32821)
-- Name: xfreturn_xfreturn_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.xfreturn_xfreturn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 262
-- Name: xfreturn_xfreturn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.xfreturn_xfreturn_id_seq OWNED BY public.xfreturn.xfreturn_id;


--
-- TOC entry 3540 (class 2604 OID 25363)
-- Name: distribution_package id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package ALTER COLUMN id SET DEFAULT nextval('public.distribution_package_id_seq'::regclass);


--
-- TOC entry 3545 (class 2604 OID 25396)
-- Name: distribution_package_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package_item ALTER COLUMN id SET DEFAULT nextval('public.distribution_package_item_id_seq'::regclass);


--
-- TOC entry 3566 (class 2604 OID 25504)
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- TOC entry 3557 (class 2604 OID 25449)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 3573 (class 2604 OID 25569)
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- TOC entry 3570 (class 2604 OID 25533)
-- Name: transfer_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request ALTER COLUMN id SET DEFAULT nextval('public.transfer_request_id_seq'::regclass);


--
-- TOC entry 3546 (class 2604 OID 25417)
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3575 (class 2604 OID 32825)
-- Name: xfreturn xfreturn_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn ALTER COLUMN xfreturn_id SET DEFAULT nextval('public.xfreturn_xfreturn_id_seq'::regclass);


--
-- TOC entry 4170 (class 0 OID 24807)
-- Dependencies: 227
-- Data for Name: agency; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agency (agency_id, agency_name, address1_text, address2_text, parish_code, contact_name, phone_no, email_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr, agency_type, ineligible_event_id, status_code, warehouse_id) FROM stdin;
1	PORTMORE COMMUNITY CENTER	45 Community Lane, Portmore	\N	12	MARY JOHNSON	876-555-5678	\N	admin	2025-11-12 03:33:09	ADMIN@ODPEM.GOV.JM	2025-11-12 17:34:31	2	SHELTER	\N	A	\N
\.


--
-- TOC entry 4211 (class 0 OID 49153)
-- Dependencies: 268
-- Data for Name: agency_account_request; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agency_account_request (request_id, agency_name, contact_name, contact_phone, contact_email, reason_text, agency_id, user_id, status_code, status_reason, created_by_id, created_at, updated_by_id, updated_at, version_nbr) FROM stdin;
\.


--
-- TOC entry 4213 (class 0 OID 49188)
-- Dependencies: 270
-- Data for Name: agency_account_request_audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agency_account_request_audit (audit_id, request_id, event_type, event_notes, actor_user_id, event_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4229 (class 0 OID 188484)
-- Dependencies: 288
-- Data for Name: batchlocation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.batchlocation (inventory_id, location_id, batch_id, create_by_id, create_dtime) FROM stdin;
\.


--
-- TOC entry 4160 (class 0 OID 24681)
-- Dependencies: 217
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.country (country_id, country_name) FROM stdin;
388	JAMAICA
\.


--
-- TOC entry 4166 (class 0 OID 24740)
-- Dependencies: 223
-- Data for Name: custodian; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.custodian (custodian_id, custodian_name, address1_text, address2_text, parish_code, contact_name, phone_no, email_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	2 Haining Road	\N	01	DIRECTOR GENERAL	876-928-5111	info@odpem.gov.jm	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1
\.


--
-- TOC entry 4185 (class 0 OID 25123)
-- Dependencies: 242
-- Data for Name: dbintake; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dbintake (reliefpkg_id, inventory_id, intake_date, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4186 (class 0 OID 25140)
-- Dependencies: 243
-- Data for Name: dbintake_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dbintake_item (reliefpkg_id, inventory_id, item_id, usable_qty, location1_id, defective_qty, location2_id, expired_qty, location3_id, uom_code, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4188 (class 0 OID 25360)
-- Dependencies: 245
-- Data for Name: distribution_package; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.distribution_package (id, package_number, recipient_agency_id, assigned_warehouse_id, event_id, status, is_partial, created_by, approved_by, approved_at, dispatched_by, dispatched_at, delivered_at, notes, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4190 (class 0 OID 25393)
-- Dependencies: 247
-- Data for Name: distribution_package_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.distribution_package_item (id, package_id, item_id, quantity, notes) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 24935)
-- Dependencies: 235
-- Data for Name: dnintake; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dnintake (donation_id, inventory_id, intake_date, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4230 (class 0 OID 188511)
-- Dependencies: 289
-- Data for Name: dnintake_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dnintake_item (donation_id, inventory_id, item_id, batch_no, batch_date, expiry_date, uom_code, avg_unit_value, usable_qty, defective_qty, expired_qty, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4176 (class 0 OID 24887)
-- Dependencies: 233
-- Data for Name: donation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donation (donation_id, donor_id, donation_desc, event_id, custodian_id, received_date, status_code, comments_text, create_by_id, create_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4177 (class 0 OID 24911)
-- Dependencies: 234
-- Data for Name: donation_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donation_item (donation_id, item_id, item_qty, uom_code, location_name, status_code, comments_text, create_by_id, create_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4164 (class 0 OID 24722)
-- Dependencies: 221
-- Data for Name: donor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donor (donor_id, donor_type, donor_name, org_type_desc, address1_text, address2_text, country_id, phone_no, email_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
2	O	RED CROSS JAMAICA	NGO	123 Main Street, Kingston	\N	388	876-555-1000	info@redcross.org.jm	ADMIN@ODPEM.GOV.JM	2025-11-12 04:40:08	ADMIN@ODPEM.GOV.JM	2025-11-12 04:40:08	1
\.


--
-- TOC entry 4222 (class 0 OID 114689)
-- Dependencies: 281
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event (event_id, event_type, start_date, event_name, event_desc, impact_desc, status_code, closed_date, reason_desc, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	STORM	2025-10-28	Hurricane Melissa	Hurricane Melissa CAT 5	All of western Jamaica was completely destroyed.	C	2025-11-16	This event is closed.	TEST.DIRECTOR@ODPEM.	2025-11-16 20:10:33	TEST.DIRECTOR@ODPEM.	2025-11-16 20:34:45	3
2	STORM	2025-11-17	Hurricane Melissa 2025	Hurricane Mellissa is a category 5 hurricane that hit landfall on October 28, 2025.	Devastating damages to the central and western of the country (St. Elizabeth, Westmoreland, St. James, Mandeville and Trelawny)	A	\N	\N	TEST.DIRECTOR@ODPEM.	2025-11-17 15:01:49	TEST.DIRECTOR@ODPEM.	2025-11-17 15:01:49	1
\.


--
-- TOC entry 4171 (class 0 OID 24824)
-- Dependencies: 228
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory (inventory_id, item_id, usable_qty, reserved_qty, defective_qty, expired_qty, uom_code, last_verified_by, last_verified_date, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr, reorder_qty) FROM stdin;
1	6	500.00	0.00	5.00	0.00	SACK	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	1	0.00
1	7	200.00	0.00	3.00	10.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	1	0.00
1	8	350.00	0.00	0.00	0.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	1	0.00
1	9	150.00	0.00	8.00	0.00	SHEET	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	1	0.00
1	10	600.00	0.00	12.00	0.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	1	0.00
8	6	180.00	0.00	2.00	0.00	SACK	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	1	0.00
8	7	75.00	0.00	1.00	5.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	1	0.00
8	8	120.00	0.00	0.00	0.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	1	0.00
8	9	60.00	0.00	3.00	0.00	SHEET	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	1	0.00
8	10	250.00	0.00	5.00	0.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	1	0.00
\.


--
-- TOC entry 4226 (class 0 OID 172070)
-- Dependencies: 285
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item (item_id, item_code, item_name, sku_code, category_id, item_desc, reorder_qty, default_uom_code, units_size_vary_flag, usage_desc, storage_desc, is_batched_flag, can_expire_flag, issuance_order, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
8	ITM-HYG-001	HYGIENE KIT FAMILY	SKU-HYG-FAM-001	4	Family hygiene kit containing soap, toothpaste, sanitary items, and toiletries	75.00	UNIT	f	\N	\N	f	f	FIFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	1
9	ITM-SHT-001	TARPAULIN HEAVY DUTY	SKU-SHT-TARP-HD-12X16	5	Heavy duty waterproof tarpaulin 12ft x 16ft for emergency shelter	30.00	SHEET	t	\N	\N	f	f	FIFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	1
10	ITM-CLO-001	BLANKET EMERGENCY	SKU-CLO-BLNK-EMG	6	Emergency thermal blanket for disaster relief distribution	100.00	UNIT	f	\N	\N	f	f	FIFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	1
7	ITM-MED-001	FIRST AID KIT STANDARD	SKU-MED-FAK-STD	3	Standard first aid kit with bandages, antiseptic, and basic medical supplies	50.00	UNIT	f	\N	\N	t	t	FEFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	TEST.DIRECTOR@ODPEM.	2025-11-17 14:41:18	2
6	ITM-RICE-001	WHITE RICE PARBOILED	SKU-RICE-WP-50KG	1	Parboiled white rice in 50kg bags for emergency food distribution	100.00	SACK	f	\N	\N	t	f	FEFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	1
\.


--
-- TOC entry 4174 (class 0 OID 24870)
-- Dependencies: 231
-- Data for Name: item_location; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_location (inventory_id, item_id, location_id, create_by_id, create_dtime) FROM stdin;
\.


--
-- TOC entry 4228 (class 0 OID 188417)
-- Dependencies: 287
-- Data for Name: itembatch; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.itembatch (batch_id, inventory_id, item_id, batch_no, batch_date, expiry_date, usable_qty, reserved_qty, defective_qty, expired_qty, uom_code, size_spec, avg_unit_value, last_verified_by, last_verified_date, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	1	6	RICE-2024-001	2024-09-01	2025-02-28	150.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
2	1	6	RICE-2024-002	2024-10-15	2025-05-31	200.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
3	1	6	RICE-2024-003	2024-11-01	2025-08-31	150.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
4	8	6	RICE-2024-MB-001	2024-10-20	2025-04-30	100.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
5	8	6	RICE-2024-MB-002	2024-11-10	2025-07-31	80.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
6	1	7	FAK-2024-001	2024-08-01	2026-08-01	80.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
7	1	7	FAK-2024-002	2024-09-15	2026-09-15	70.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
8	1	7	FAK-2024-003	2024-10-20	2026-10-20	50.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
9	8	7	FAK-2024-MB-001	2024-09-01	2026-09-01	40.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
10	8	7	FAK-2024-MB-002	2024-11-01	2026-11-01	35.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
\.


--
-- TOC entry 4224 (class 0 OID 131093)
-- Dependencies: 283
-- Data for Name: itemcatg; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.itemcatg (category_id, category_code, category_desc, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	FOOD	Food and Consumables	\N	I	TEST.DIRECTOR@ODPEM.	2025-11-17 00:50:18	TEST.DIRECTOR@ODPEM.	2025-11-17 00:50:18	1
3	MEDICAL	Medical Supplies and Equipment	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	1
4	HYGIENE	Hygiene and Sanitation Products	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	1
5	SHELTER	Shelter and Construction Materials	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	1
6	CLOTHING	Clothing and Textiles	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	1
\.


--
-- TOC entry 4173 (class 0 OID 24856)
-- Dependencies: 230
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.location (location_id, inventory_id, location_desc, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4198 (class 0 OID 25501)
-- Dependencies: 255
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notification (id, user_id, warehouse_id, reliefrqst_id, title, message, type, status, link_url, payload, is_archived, created_at) FROM stdin;
36	6	\N	16	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000016 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/16	\N	f	2025-11-17 15:50:10.319459
37	12	\N	16	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000016 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/16	\N	f	2025-11-17 15:50:10.319734
38	8	\N	16	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000016 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/16	\N	f	2025-11-17 15:50:10.319793
39	9	\N	16	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000016 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/16	\N	f	2025-11-17 15:50:10.319827
40	4	\N	16	Relief Request Approved	Your relief request RR-000016 for Hurricane Melissa 2025 has been approved by Brian Custodian. Click to view details.	reliefrqst_approved	unread	/packaging/16/prepare	\N	f	2025-11-17 15:55:11.151271
41	2	\N	16	Relief Request Approved	Your relief request RR-000016 for Hurricane Melissa 2025 has been approved by Brian Custodian. Click to view details.	reliefrqst_approved	unread	/packaging/16/prepare	\N	f	2025-11-17 15:55:11.200154
42	3	\N	16	Relief Request Approved	Your relief request RR-000016 for Hurricane Melissa 2025 has been approved by Brian Custodian. Click to view details.	reliefrqst_approved	unread	/packaging/16/prepare	\N	f	2025-11-17 15:55:11.244292
43	6	\N	17	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000017 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/17	\N	f	2025-11-17 18:31:37.087964
44	12	\N	17	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000017 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/17	\N	f	2025-11-17 18:31:37.088126
45	8	\N	17	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000017 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/17	\N	f	2025-11-17 18:31:37.088198
46	9	\N	17	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000017 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/17	\N	f	2025-11-17 18:31:37.088244
47	4	\N	17	Relief Request Approved	RR-000017 from PORTMORE COMMUNITY CENTER (Event: Hurricane Melissa 2025) approved by Brian Custodian. Click to prepare fulfillment package.	reliefrqst_approved	unread	/packaging/17/prepare	\N	f	2025-11-17 18:31:58.029942
48	2	\N	17	Relief Request Approved	RR-000017 from PORTMORE COMMUNITY CENTER (Event: Hurricane Melissa 2025) approved by Brian Custodian. Click to prepare fulfillment package.	reliefrqst_approved	unread	/packaging/17/prepare	\N	f	2025-11-17 18:31:58.07411
49	3	\N	17	Relief Request Approved	RR-000017 from PORTMORE COMMUNITY CENTER (Event: Hurricane Melissa 2025) approved by Brian Custodian. Click to prepare fulfillment package.	reliefrqst_approved	unread	/packaging/17/prepare	\N	f	2025-11-17 18:31:58.117229
\.


--
-- TOC entry 4161 (class 0 OID 24686)
-- Dependencies: 218
-- Data for Name: parish; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parish (parish_code, parish_name) FROM stdin;
01	Kingston
02	St. Andrew
03	St. Thomas
04	Portland
05	St. Mary
06	St. Ann
07	Trelawny
08	St. James
09	Hanover
10	Westmoreland
11	St. Elizabeth
12	Manchester
13	Clarendon
14	St. Catherine
\.


--
-- TOC entry 4216 (class 0 OID 65562)
-- Dependencies: 273
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.permission (perm_id, resource, action, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	reliefrqst	create	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
2	reliefrqst	submit	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
3	reliefrqst	cancel	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
4	reliefrqst	view	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
5	reliefrqst	view_all	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
6	reliefrqst	approve_eligibility	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
7	reliefrqst	fill_plan_edit	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
8	reliefrqst	fill_plan_approve	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
9	reliefrqst	close	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
10	reliefrqst_item	view	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
11	reliefrqst_item	edit_fill	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
12	reliefpkg	create	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
13	reliefpkg	dispatch	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
14	reliefpkg	receive	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
15	reliefpkg	verify	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
16	inventory	view	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
17	inventory	reserve_for_request	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
18	inventory	reconcile_dispatch	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
19	agency_account	request	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
20	agency_account	review	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
21	agency_account	approve	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
22	agency_account	deny	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
23	agency_account	provision	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
24	users	manage	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
25	reports	view_own	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
26	reports	view_ops	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
27	reports	view_exec	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
28	EVENT	VIEW	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
29	EVENT	CREATE	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
30	EVENT	UPDATE	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
31	EVENT	CLOSE	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
32	EVENT	DELETE	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
\.


--
-- TOC entry 4220 (class 0 OID 106496)
-- Dependencies: 279
-- Data for Name: relief_request_fulfillment_lock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.relief_request_fulfillment_lock (reliefrqst_id, fulfiller_user_id, fulfiller_email, acquired_at, expires_at) FROM stdin;
16	3	logistics.officer@gov.jm	2025-11-17 15:55:37.61978	2025-11-18 15:55:37.61977
17	3	logistics.officer@gov.jm	2025-11-17 18:32:04.953211	2025-11-18 18:32:04.953197
\.


--
-- TOC entry 4184 (class 0 OID 25077)
-- Dependencies: 241
-- Data for Name: reliefpkg; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefpkg (reliefpkg_id, to_inventory_id, reliefrqst_id, start_date, dispatch_dtime, transport_mode, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr, received_by_id, received_dtime) FROM stdin;
5	1	16	2025-11-17	\N	\N	\N	P	LOGISTICS.OFFICER@GO	2025-11-17 18:30:27	LOGISTICS.OFFICER@GO	2025-11-17 18:30:27	LOGISTICS.OFFICER@GO	\N	1	LOGISTICS.OFFICER@GO	\N
6	1	17	2025-11-17	\N	\N	\N	P	LOGISTICS.OFFICER@GO	2025-11-17 19:23:15	LOGISTICS.OFFICER@GO	2025-11-17 19:23:15	LOGISTICS.OFFICER@GO	\N	1	LOGISTICS.OFFICER@GO	\N
\.


--
-- TOC entry 4232 (class 0 OID 204801)
-- Dependencies: 291
-- Data for Name: reliefpkg_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefpkg_item (reliefpkg_id, fr_inventory_id, batch_id, item_id, item_qty, uom_code, reason_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4182 (class 0 OID 25029)
-- Dependencies: 239
-- Data for Name: reliefrqst; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefrqst (reliefrqst_id, agency_id, request_date, urgency_ind, status_code, create_by_id, create_dtime, review_by_id, review_dtime, action_by_id, action_dtime, version_nbr, eligible_event_id, rqst_notes_text, review_notes_text, tracking_no, status_reason_desc, receive_by_id, receive_dtime) FROM stdin;
16	1	2025-11-17	M	3	shelter_user@gmail.c	2025-11-17 15:35:35	TEST.DIRECTOR@ODPEM.	2025-11-17 15:55:11	\N	\N	3	2	Urgently needed at the shelter.	\N	49448B2	\N	\N	\N
17	1	2025-11-17	M	3	SHELTER_USER@GMAIL.C	2025-11-17 18:30:54	TEST.DIRECTOR@ODPEM.	2025-11-17 18:31:58	\N	\N	3	2		\N	7D68A45	\N	\N	\N
\.


--
-- TOC entry 4218 (class 0 OID 90113)
-- Dependencies: 275
-- Data for Name: reliefrqst_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefrqst_item (reliefrqst_id, item_id, request_qty, issue_qty, urgency_ind, rqst_reason_desc, required_by_date, status_code, status_reason_desc, action_by_id, action_dtime, version_nbr) FROM stdin;
16	7	20.00	0.00	M		\N	R	\N	\N	\N	2
16	8	10.00	0.00	H	Out of toilet paper.	2025-11-18	R	\N	\N	\N	2
17	8	10.00	0.00	L		\N	R	\N	\N	\N	2
17	10	20.00	0.00	M		\N	R	\N	\N	\N	2
\.


--
-- TOC entry 4214 (class 0 OID 57344)
-- Dependencies: 271
-- Data for Name: reliefrqst_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefrqst_status (status_code, status_desc, is_active_flag, reason_rqrd_flag) FROM stdin;
0	DRAFT	t	f
1	AWAITING APPROVAL	t	f
2	CANCELLED	t	f
3	SUBMITTED	t	f
4	DENIED	t	f
5	PART FILLED	t	f
6	CLOSED	t	f
7	FILLED	t	f
8	INELIGIBLE	t	f
\.


--
-- TOC entry 4219 (class 0 OID 98304)
-- Dependencies: 276
-- Data for Name: reliefrqstitem_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefrqstitem_status (status_code, status_desc, item_qty_rule, active_flag, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
R	REQUESTED	EZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
U	UNAVAILABLE	EZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
W	AWAITING AVAILABILITY	EZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
D	DENIED	EZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
P	PARTLY FILLED	GZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
L	ALLOWED LIMIT	GZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
F	FILLED	ER	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
\.


--
-- TOC entry 4194 (class 0 OID 25446)
-- Dependencies: 251
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.role (id, code, name, description, created_at) FROM stdin;
1	SYSTEM_ADMINISTRATOR	System Administrator	Full system access and configuration	2025-11-12 03:31:52.007644
2	LOGISTICS_MANAGER	Logistics Manager	Oversees all logistics operations	2025-11-12 03:31:52.007644
3	LOGISTICS_OFFICER	Logistics Officer	Manages inventory and fulfillment	2025-11-12 03:31:52.007644
7	INVENTORY_CLERK	Inventory Clerk	Stock management	2025-11-12 03:31:52.007644
8	AUDITOR	Auditor	Compliance and audit access	2025-11-12 03:31:52.007644
10	AGENCY_DISTRIBUTOR	Agency (Distributor)	Distributes relief items to beneficiaries	2025-11-13 14:23:48.666505
11	AGENCY_SHELTER	Agency (Shelter)	Manages shelter and evacuation operations	2025-11-13 14:23:48.666505
15	ODPEM_DIR_PEOD	Director, PEOD	Plans and coordinates emergency operations	2025-11-13 14:23:48.666505
16	ODPEM_DDG	Deputy Director General	Deputy head of disaster management	2025-11-13 14:23:48.666505
17	ODPEM_DG	Director General	Chief executive of disaster operations	2025-11-13 14:23:48.666505
19	CUSTODIAN	Custodian	Role responsible for managing disaster events and event lifecycle in DRIMS.	2025-11-16 18:45:44.964132
\.


--
-- TOC entry 4217 (class 0 OID 65574)
-- Dependencies: 274
-- Data for Name: role_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.role_permission (role_id, perm_id, scope_json, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
15	6	\N	system	2025-11-13 16:42:35	system	2025-11-13 16:42:35	1
17	6	\N	system	2025-11-13 16:42:48	system	2025-11-13 16:42:48	1
16	6	\N	system	2025-11-13 16:42:48	system	2025-11-13 16:42:48	1
19	28	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
19	29	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
19	30	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
19	31	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
19	32	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
\.


--
-- TOC entry 4208 (class 0 OID 32867)
-- Dependencies: 265
-- Data for Name: rtintake; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rtintake (xfreturn_id, inventory_id, intake_date, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4209 (class 0 OID 32884)
-- Dependencies: 266
-- Data for Name: rtintake_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rtintake_item (xfreturn_id, inventory_id, item_id, usable_qty, location1_id, defective_qty, location2_id, expired_qty, location3_id, uom_code, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4202 (class 0 OID 25566)
-- Dependencies: 259
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transaction (id, item_id, ttype, qty, warehouse_id, donor_id, event_id, expiry_date, notes, created_at, created_by) FROM stdin;
\.


--
-- TOC entry 4180 (class 0 OID 24989)
-- Dependencies: 237
-- Data for Name: transfer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transfer (transfer_id, fr_inventory_id, to_inventory_id, transfer_date, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr, event_id, reason_text) FROM stdin;
\.


--
-- TOC entry 4231 (class 0 OID 196608)
-- Dependencies: 290
-- Data for Name: transfer_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transfer_item (transfer_id, inventory_id, item_id, batch_id, item_qty, uom_code, reason_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4200 (class 0 OID 25530)
-- Dependencies: 257
-- Data for Name: transfer_request; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transfer_request (id, from_warehouse_id, to_warehouse_id, item_id, quantity, status, requested_by, requested_at, reviewed_by, reviewed_at, notes) FROM stdin;
\.


--
-- TOC entry 4162 (class 0 OID 24692)
-- Dependencies: 219
-- Data for Name: unitofmeasure; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitofmeasure (uom_code, uom_desc, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr, status_code) FROM stdin;
UNIT	Individual units	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
KG	Kilograms	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
LITRE	Litres	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
BOX	Boxes	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
SACK	Sacks	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
BOTTLE	Bottles	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
GALLON	Gallons	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
METRE	Metres	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
SHEET	Sheets	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
BAG	Bag	\N	TEST.DIRECTOR@ODPEM.	2025-11-17 02:11:02	TEST.DIRECTOR@ODPEM.	2025-11-17 02:11:02	1	I
\.


--
-- TOC entry 4192 (class 0 OID 25414)
-- Dependencies: 249
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" (user_id, email, password_hash, first_name, last_name, full_name, is_active, organization, job_title, phone, timezone, language, notification_preferences, assigned_warehouse_id, last_login_at, create_dtime, update_dtime, username, password_algo, mfa_enabled, mfa_secret, failed_login_count, lock_until_at, password_changed_at, agency_id, status_code, version_nbr, user_name) FROM stdin;
1	admin@odpem.gov.jm	scrypt:32768:8:1$0PuV6qs6LRiBTD7u$921f818d09bd67feaf84370eacdec9b80eb9c5722adc7ae8ef1a9c8310a6eebabe67001f1ac7d538880536b95d0f7f131e693247b8036a29fd3b4d94e60e20cd	SYSTEM	ADMINISTRATOR	SYSTEM ADMINISTRATOR	t	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 03:33:08.574171	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	ADMIN@ODPEM.GOV.JM
2	test.user@odpem.gov.jm	scrypt:32768:8:1$sqD9e0ANt6oD7Jlx$35bf7c14e18395535f4d6089462151b326036e163f7a27bd82ae9b4976a3b00311775c3bf5bef4a69200a5872ece2a67639de751f208dd7649d42213ce3a4c1a	Test	User	Test User	t	ODPEM	Test Officer	876-555-1234	America/Jamaica	en	\N	\N	\N	2025-11-12 04:37:13.113929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	TEST.USER@ODPEM.GOV.
3	logistics.officer@gov.jm	scrypt:32768:8:1$fONJDxe4oj1F54Eo$e4136a2fd6d9f2414cc4832b4f710929e99965f7269b188f9c4a2f6deb6a5df9be4d58057c6d0f9cf8831a4a3d0381fe89d25ad532ef8656be9defe727aa77f4	Demar	Brown	Demar Brown	t	ODPEM	Logistics Officer	8764774108	America/Jamaica	en	\N	\N	\N	2025-11-12 14:50:31.22187	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	LOGISTICS.OFFICER@GO
4	logistics.manager@gov.jm	scrypt:32768:8:1$ZTaPUnWLaFL0cG6c$2454040e9932d768d65cedbbb8472f793c9d0ba346ced95e20d2f919a1e19e538c285136ecc0ee77ded3d8154a22680ba85ed708ea139db22adcda3b4d2bacf4	Anthony	Bailey	Anthony Bailey	t	ODPEM	Logistics Manager	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 14:51:28.952847	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	LOGISTICS.MANAGER@GO
5	inventory@odpem.gov.jm	scrypt:32768:8:1$6ig20TktfeObRqbD$eeb7b7453b72c0ad82f193051baaa56bcb7f7603af5e9130a6e109faf91eaffbe0f86b3e9591f6a159c955248c47e5e720033dc295bfb3fd7b4aeaa8f0884653	Dale	Johnson	Dale Johnson	t	ODPEM	Inventory Clerk	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 21:06:10.280386	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	INVENTORY@ODPEM.GOV.
7	shelter_user@gmail.com	scrypt:32768:8:1$mIXQdTZPkthL4Fiu$5b1c2ae661efa73eee1868226ea9bb19b73553ebcbfbb9d7ce5de24fe0d7136703fd4f77e2dd5e0147f91a03babf445bbc8c21b695cd55ac62ee49023f5743f2	Elton	John	Elton John	t	PORTMORE COMMUNITY CENTER	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 22:35:06.738396	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	1	A	1	SHELTER_USER@GMAIL.C
8	deputy_dg@odpem.gov.jm	scrypt:32768:8:1$ewjkJ5jSB0wICDtI$893138815b08b2dc6aad8c4af27d041199084b08e9db66717594e7a5972f04cdf365fbeaf71eac95393512544a0e1ed69b067a18630a971adfa1088e1b964c1d	Luke	Hall	Luke Hall	t	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	Deputy Director General	\N	America/Jamaica	en	\N	\N	\N	2025-11-13 16:28:42.440061	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	DEPUTY_DG@ODPEM.GOV.
9	director_general@odpem.gov.jm	scrypt:32768:8:1$AMiB02zzxJCiYNuH$ffa0ed725af1c20ba9e2c0a527d676578858392b717751f9ae538eac67dc2fbd3825929f99fcf198693ebe12cf1e646349c82e9193637bd022871ebb56d1291c	Michael	Graham	Michael Graham	t	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-13 16:30:19.338658	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	DIRECTOR_GENERAL@ODP
6	executive@odpem.gov.jm	scrypt:32768:8:1$TAlF4ihd3cus89dC$6d2eaa23be7ca1ac824a5dfe97f0dc545baf4fa2a63124c289f2b034299d96020595063e7e1c4f2aecd3f96acd4824eca747fe96e4d5f1a3efa0540b66654bc3	Sarah	Johnson	Sarah Johnson	t	\N	Director of PEOD	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 21:07:50.266216	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	2	EXECUTIVE@ODPEM.GOV.
13	test.inventory@odpem.gov.jm	scrypt:32768:8:1$pnQGDxLAVYfoDwXn$0f34b0fb89a17607df11c4f108419250869428b7fcd02cad037946dbd28997b2fe9ede18d32d167a90754cc387b7d3136ac5759342b8f5605d3c0af3db650742	Test	Inventory	TEST INVENTORY	f	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-14 16:45:50.995929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	4	TEST.INVENTORY@ODPEM
10	test.logistics@odpem.gov.jm	scrypt:32768:8:1$pnQGDxLAVYfoDwXn$0f34b0fb89a17607df11c4f108419250869428b7fcd02cad037946dbd28997b2fe9ede18d32d167a90754cc387b7d3136ac5759342b8f5605d3c0af3db650742	Test	Logistics	TEST LOGISTICS	f	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-14 16:45:50.995929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	2	TEST.LOGISTICS@ODPEM
11	test.agency@gmail.com	scrypt:32768:8:1$pnQGDxLAVYfoDwXn$0f34b0fb89a17607df11c4f108419250869428b7fcd02cad037946dbd28997b2fe9ede18d32d167a90754cc387b7d3136ac5759342b8f5605d3c0af3db650742	Test	Agency	TEST AGENCY	f	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-14 16:45:50.995929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	1	A	2	TEST.AGENCY@GMAIL.CO
12	test.director@odpem.gov.jm	scrypt:32768:8:1$68bWjl9Gi03ikMW6$c9fc10b4f486946d97b2391ec3f96817e0f50c0cc890c6a3164ef061bbec393aaaa488fd30e99fbd13304e9de6c41cefb6d50428422b338660c2d55ea6dcaf1b	Brian	Custodian	Brian Custodian	t	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-14 16:45:50.995929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	5	TEST.DIRECTOR@ODPEM.
\.


--
-- TOC entry 4195 (class 0 OID 25458)
-- Dependencies: 252
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_role (user_id, role_id, assigned_at, assigned_by, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
2	3	2025-11-12 04:37:13.147794	\N	system	2025-11-13 14:06:16	system	2025-11-13 14:06:16	1
3	3	2025-11-12 14:50:31.272676	\N	system	2025-11-13 14:06:16	system	2025-11-13 14:06:16	1
4	2	2025-11-12 14:51:28.973891	\N	system	2025-11-13 14:06:16	system	2025-11-13 14:06:16	1
5	7	2025-11-12 21:06:10.335557	\N	system	2025-11-13 14:06:16	system	2025-11-13 14:06:16	1
1	1	2025-11-12 03:33:08.574171	\N	system	2025-11-13 14:06:16	system	2025-11-13 14:06:16	1
8	16	2025-11-13 16:28:42.495839	\N	system	2025-11-13 16:28:42	system	2025-11-13 16:28:42	1
9	17	2025-11-13 16:30:19.362036	\N	system	2025-11-13 16:30:19	system	2025-11-13 16:30:19	1
6	15	2025-11-13 16:38:27.445022	\N	system	2025-11-13 16:38:27	system	2025-11-13 16:38:27	1
10	2	2025-11-14 16:49:30.875608	\N	system	2025-11-14 16:49:31	system	2025-11-14 16:49:31	1
11	11	2025-11-14 16:49:30.875608	\N	system	2025-11-14 16:49:31	system	2025-11-14 16:49:31	1
13	7	2025-11-14 16:49:30.875608	\N	system	2025-11-14 16:49:31	system	2025-11-14 16:49:31	1
7	11	2025-11-14 18:14:02.832752	\N	system	2025-11-14 18:14:03	system	2025-11-14 18:14:03	1
12	15	2025-11-16 19:15:39.788416	\N	system	2025-11-16 19:15:40	system	2025-11-16 19:15:40	1
12	19	2025-11-16 19:15:39.788423	\N	system	2025-11-16 19:15:40	system	2025-11-16 19:15:40	1
\.


--
-- TOC entry 4196 (class 0 OID 25479)
-- Dependencies: 253
-- Data for Name: user_warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_warehouse (user_id, warehouse_id, assigned_at, assigned_by) FROM stdin;
2	1	2025-11-12 04:37:13.170464	\N
5	1	2025-11-12 21:06:10.359982	\N
8	1	2025-11-13 16:28:42.521335	\N
9	1	2025-11-13 16:30:19.384624	\N
6	1	2025-11-13 16:38:27.489142	\N
\.


--
-- TOC entry 4168 (class 0 OID 24785)
-- Dependencies: 225
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.warehouse (warehouse_id, warehouse_name, warehouse_type, address1_text, address2_text, parish_code, contact_name, phone_no, email_text, custodian_id, status_code, reason_desc, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
8	MONTEGO BAY RELIEF CENTER	SUB-HUB	15 BAY STREET	MONTEGO BAY	01	PATRICIA BROWN	+1 (876) 555-0199	patricia.brown@odpem.gov.jm	1	A	\N	system	2025-11-13 23:54:15	TEST.DIRECTOR@ODPEM.	2025-11-16 21:41:28	2
1	KINGSTON CENTRAL DEPOT	MAIN-HUB	123 Main Street, Kingston	\N	01	JOHN BROWN	+1 (876) 555-1234	\N	1	A	\N	admin	2025-11-12 03:33:09	TEST.DIRECTOR@ODPEM.	2025-11-16 21:44:26	9
9	TRELAWNY CENTRAL DEPOT	SUB-HUB	51 Main Road	\N	07	JOHN SMITH	+1 (876) 456-0987	wbrown@odpem.gov.jm	1	I	Under Construction	TEST.DIRECTOR@ODPEM.	2025-11-16 21:33:00	TEST.DIRECTOR@ODPEM.	2025-11-16 21:48:36	3
\.


--
-- TOC entry 4203 (class 0 OID 32768)
-- Dependencies: 260
-- Data for Name: xfintake; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.xfintake (transfer_id, inventory_id, intake_date, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4204 (class 0 OID 32785)
-- Dependencies: 261
-- Data for Name: xfintake_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.xfintake_item (transfer_id, inventory_id, item_id, usable_qty, location1_id, defective_qty, location2_id, expired_qty, location3_id, uom_code, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4206 (class 0 OID 32822)
-- Dependencies: 263
-- Data for Name: xfreturn; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.xfreturn (xfreturn_id, fr_inventory_id, to_inventory_id, return_date, reason_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4207 (class 0 OID 32844)
-- Dependencies: 264
-- Data for Name: xfreturn_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.xfreturn_item (xfreturn_id, inventory_id, item_id, usable_qty, defective_qty, expired_qty, uom_code, reason_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 269
-- Name: agency_account_request_audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agency_account_request_audit_audit_id_seq', 1, false);


--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 267
-- Name: agency_account_request_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agency_account_request_request_id_seq', 1, false);


--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 226
-- Name: agency_agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agency_agency_id_seq', 2, true);


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 222
-- Name: custodian_custodian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.custodian_custodian_id_seq', 1, true);


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 244
-- Name: distribution_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.distribution_package_id_seq', 1, false);


--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 246
-- Name: distribution_package_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.distribution_package_item_id_seq', 1, false);


--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 232
-- Name: donation_donation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.donation_donation_id_seq', 1, false);


--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 220
-- Name: donor_donor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.donor_donor_id_seq', 2, true);


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 280
-- Name: event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_event_id_seq', 2, true);


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 284
-- Name: item_new_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_new_item_id_seq', 10, true);


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 286
-- Name: itembatch_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.itembatch_batch_id_seq', 10, true);


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 282
-- Name: itemcatg_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.itemcatg_category_id_seq', 6, true);


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 229
-- Name: location_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.location_location_id_seq', 1, false);


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 254
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notification_id_seq', 49, true);


--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 272
-- Name: permission_perm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.permission_perm_id_seq', 32, true);


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 240
-- Name: reliefpkg_reliefpkg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reliefpkg_reliefpkg_id_seq', 6, true);


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 238
-- Name: reliefrqst_reliefrqst_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reliefrqst_reliefrqst_id_seq', 17, true);


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 250
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.role_id_seq', 20, true);


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 258
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transaction_id_seq', 1, false);


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 256
-- Name: transfer_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transfer_request_id_seq', 1, false);


--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 236
-- Name: transfer_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transfer_transfer_id_seq', 1, false);


--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_id_seq', 17, true);


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 224
-- Name: warehouse_warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.warehouse_warehouse_id_seq', 9, true);


--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 262
-- Name: xfreturn_xfreturn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.xfreturn_xfreturn_id_seq', 1, false);


--
-- TOC entry 3836 (class 2606 OID 49194)
-- Name: agency_account_request_audit agency_account_request_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request_audit
    ADD CONSTRAINT agency_account_request_audit_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 3832 (class 2606 OID 49163)
-- Name: agency_account_request agency_account_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT agency_account_request_pkey PRIMARY KEY (request_id);


--
-- TOC entry 3737 (class 2606 OID 24815)
-- Name: agency agency_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT agency_pkey PRIMARY KEY (agency_id);


--
-- TOC entry 3721 (class 2606 OID 24685)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- TOC entry 3773 (class 2606 OID 25148)
-- Name: dbintake_item dbintake_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_pkey PRIMARY KEY (reliefpkg_id, inventory_id, item_id);


--
-- TOC entry 3771 (class 2606 OID 25129)
-- Name: dbintake dbintake_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake
    ADD CONSTRAINT dbintake_pkey PRIMARY KEY (reliefpkg_id, inventory_id);


--
-- TOC entry 3784 (class 2606 OID 25400)
-- Name: distribution_package_item distribution_package_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package_item
    ADD CONSTRAINT distribution_package_item_pkey PRIMARY KEY (id);


--
-- TOC entry 3777 (class 2606 OID 25373)
-- Name: distribution_package distribution_package_package_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_package_number_key UNIQUE (package_number);


--
-- TOC entry 3779 (class 2606 OID 25371)
-- Name: distribution_package distribution_package_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_pkey PRIMARY KEY (id);


--
-- TOC entry 3755 (class 2606 OID 24941)
-- Name: dnintake dnintake_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake
    ADD CONSTRAINT dnintake_pkey PRIMARY KEY (donation_id, inventory_id);


--
-- TOC entry 3753 (class 2606 OID 24919)
-- Name: donation_item donation_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation_item
    ADD CONSTRAINT donation_item_pkey PRIMARY KEY (donation_id, item_id);


--
-- TOC entry 3751 (class 2606 OID 24895)
-- Name: donation donation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_pkey PRIMARY KEY (donation_id);


--
-- TOC entry 3727 (class 2606 OID 24731)
-- Name: donor donor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT donor_pkey PRIMARY KEY (donor_id);


--
-- TOC entry 3749 (class 2606 OID 24874)
-- Name: item_location item_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_location
    ADD CONSTRAINT item_location_pkey PRIMARY KEY (item_id, location_id);


--
-- TOC entry 3746 (class 2606 OID 24863)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- TOC entry 3807 (class 2606 OID 25511)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3723 (class 2606 OID 24691)
-- Name: parish parish_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parish
    ADD CONSTRAINT parish_pkey PRIMARY KEY (parish_code);


--
-- TOC entry 3841 (class 2606 OID 65571)
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (perm_id);


--
-- TOC entry 3886 (class 2606 OID 188488)
-- Name: batchlocation pk_batchlocation; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT pk_batchlocation PRIMARY KEY (inventory_id, location_id, batch_id);


--
-- TOC entry 3731 (class 2606 OID 24749)
-- Name: custodian pk_custodian; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custodian
    ADD CONSTRAINT pk_custodian PRIMARY KEY (custodian_id);


--
-- TOC entry 3890 (class 2606 OID 188523)
-- Name: dnintake_item pk_dnintake_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake_item
    ADD CONSTRAINT pk_dnintake_item PRIMARY KEY (donation_id, inventory_id, item_id, batch_no);


--
-- TOC entry 3858 (class 2606 OID 114700)
-- Name: event pk_event; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT pk_event PRIMARY KEY (event_id);


--
-- TOC entry 3742 (class 2606 OID 237586)
-- Name: inventory pk_inventory; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT pk_inventory PRIMARY KEY (inventory_id, item_id);


--
-- TOC entry 3868 (class 2606 OID 172137)
-- Name: item pk_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT pk_item PRIMARY KEY (item_id);


--
-- TOC entry 3880 (class 2606 OID 188436)
-- Name: itembatch pk_itembatch; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itembatch
    ADD CONSTRAINT pk_itembatch PRIMARY KEY (batch_id);


--
-- TOC entry 3861 (class 2606 OID 131101)
-- Name: itemcatg pk_itemcatg; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itemcatg
    ADD CONSTRAINT pk_itemcatg PRIMARY KEY (category_id);


--
-- TOC entry 3900 (class 2606 OID 204807)
-- Name: reliefpkg_item pk_reliefpkg_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg_item
    ADD CONSTRAINT pk_reliefpkg_item PRIMARY KEY (reliefpkg_id, fr_inventory_id, batch_id, item_id);


--
-- TOC entry 3765 (class 2606 OID 25040)
-- Name: reliefrqst pk_reliefrqst; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst
    ADD CONSTRAINT pk_reliefrqst PRIMARY KEY (reliefrqst_id);


--
-- TOC entry 3850 (class 2606 OID 90131)
-- Name: reliefrqst_item pk_reliefrqst_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_item
    ADD CONSTRAINT pk_reliefrqst_item PRIMARY KEY (reliefrqst_id, item_id);


--
-- TOC entry 3839 (class 2606 OID 57349)
-- Name: reliefrqst_status pk_reliefrqst_status; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_status
    ADD CONSTRAINT pk_reliefrqst_status PRIMARY KEY (status_code);


--
-- TOC entry 3852 (class 2606 OID 98309)
-- Name: reliefrqstitem_status pk_reliefrqstitem_status; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqstitem_status
    ADD CONSTRAINT pk_reliefrqstitem_status PRIMARY KEY (status_code);


--
-- TOC entry 3847 (class 2606 OID 65585)
-- Name: role_permission pk_role_permission; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT pk_role_permission PRIMARY KEY (role_id, perm_id);


--
-- TOC entry 3826 (class 2606 OID 32873)
-- Name: rtintake pk_rtintake; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake
    ADD CONSTRAINT pk_rtintake PRIMARY KEY (xfreturn_id, inventory_id);


--
-- TOC entry 3830 (class 2606 OID 32892)
-- Name: rtintake_item pk_rtintake_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT pk_rtintake_item PRIMARY KEY (xfreturn_id, inventory_id, item_id);


--
-- TOC entry 3895 (class 2606 OID 196614)
-- Name: transfer_item pk_transfer_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_item
    ADD CONSTRAINT pk_transfer_item PRIMARY KEY (transfer_id, item_id, batch_id);


--
-- TOC entry 3725 (class 2606 OID 24699)
-- Name: unitofmeasure pk_unitofmeasure; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitofmeasure
    ADD CONSTRAINT pk_unitofmeasure PRIMARY KEY (uom_code);


--
-- TOC entry 3813 (class 2606 OID 32774)
-- Name: xfintake pk_xfintake; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake
    ADD CONSTRAINT pk_xfintake PRIMARY KEY (transfer_id, inventory_id);


--
-- TOC entry 3817 (class 2606 OID 32793)
-- Name: xfintake_item pk_xfintake_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake_item
    ADD CONSTRAINT pk_xfintake_item PRIMARY KEY (transfer_id, inventory_id, item_id);


--
-- TOC entry 3824 (class 2606 OID 32851)
-- Name: xfreturn_item pk_xfreturn_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn_item
    ADD CONSTRAINT pk_xfreturn_item PRIMARY KEY (xfreturn_id, inventory_id, item_id);


--
-- TOC entry 3856 (class 2606 OID 106502)
-- Name: relief_request_fulfillment_lock relief_request_fulfillment_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relief_request_fulfillment_lock
    ADD CONSTRAINT relief_request_fulfillment_lock_pkey PRIMARY KEY (reliefrqst_id);


--
-- TOC entry 3769 (class 2606 OID 25087)
-- Name: reliefpkg reliefpkg_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg
    ADD CONSTRAINT reliefpkg_pkey PRIMARY KEY (reliefpkg_id);


--
-- TOC entry 3795 (class 2606 OID 25456)
-- Name: role role_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_code_key UNIQUE (code);


--
-- TOC entry 3797 (class 2606 OID 25454)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3811 (class 2606 OID 25574)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 24997)
-- Name: transfer transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT transfer_pkey PRIMARY KEY (transfer_id);


--
-- TOC entry 3809 (class 2606 OID 25539)
-- Name: transfer_request transfer_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_pkey PRIMARY KEY (id);


--
-- TOC entry 3739 (class 2606 OID 24817)
-- Name: agency uk_agency_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT uk_agency_1 UNIQUE (agency_name);


--
-- TOC entry 3733 (class 2606 OID 24751)
-- Name: custodian uk_custodian_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custodian
    ADD CONSTRAINT uk_custodian_1 UNIQUE (custodian_name);


--
-- TOC entry 3729 (class 2606 OID 24733)
-- Name: donor uk_donor_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT uk_donor_1 UNIQUE (donor_name);


--
-- TOC entry 3870 (class 2606 OID 172082)
-- Name: item uk_item_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT uk_item_1 UNIQUE (item_code);


--
-- TOC entry 3872 (class 2606 OID 172084)
-- Name: item uk_item_2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT uk_item_2 UNIQUE (item_name);


--
-- TOC entry 3874 (class 2606 OID 172086)
-- Name: item uk_item_3; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT uk_item_3 UNIQUE (sku_code);


--
-- TOC entry 3863 (class 2606 OID 131103)
-- Name: itemcatg uk_itemcatg_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itemcatg
    ADD CONSTRAINT uk_itemcatg_1 UNIQUE (category_code);


--
-- TOC entry 3843 (class 2606 OID 65573)
-- Name: permission uq_permission_resource_action; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT uq_permission_resource_action UNIQUE (resource, action);


--
-- TOC entry 3790 (class 2606 OID 25428)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 3792 (class 2606 OID 25426)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3801 (class 2606 OID 25463)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3803 (class 2606 OID 25484)
-- Name: user_warehouse user_warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_warehouse
    ADD CONSTRAINT user_warehouse_pkey PRIMARY KEY (user_id, warehouse_id);


--
-- TOC entry 3735 (class 2606 OID 24795)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehouse_id);


--
-- TOC entry 3822 (class 2606 OID 32830)
-- Name: xfreturn xfreturn_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn
    ADD CONSTRAINT xfreturn_pkey PRIMARY KEY (xfreturn_id);


--
-- TOC entry 3837 (class 1259 OID 49205)
-- Name: dk_aar_audit_req_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_aar_audit_req_time ON public.agency_account_request_audit USING btree (request_id, event_dtime);


--
-- TOC entry 3833 (class 1259 OID 49185)
-- Name: dk_aar_status_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_aar_status_created ON public.agency_account_request USING btree (status_code, created_at);


--
-- TOC entry 3884 (class 1259 OID 188509)
-- Name: dk_batchlocation_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_batchlocation_1 ON public.batchlocation USING btree (batch_id, location_id);


--
-- TOC entry 3774 (class 1259 OID 25174)
-- Name: dk_dbintake_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_dbintake_item_1 ON public.dbintake_item USING btree (inventory_id, item_id);


--
-- TOC entry 3775 (class 1259 OID 25175)
-- Name: dk_dbintake_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_dbintake_item_2 ON public.dbintake_item USING btree (item_id);


--
-- TOC entry 3887 (class 1259 OID 188539)
-- Name: dk_dnintake_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_dnintake_item_1 ON public.dnintake_item USING btree (inventory_id, item_id);


--
-- TOC entry 3888 (class 1259 OID 188540)
-- Name: dk_dnintake_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_dnintake_item_2 ON public.dnintake_item USING btree (item_id);


--
-- TOC entry 3740 (class 1259 OID 237610)
-- Name: dk_inventory_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_inventory_1 ON public.inventory USING btree (item_id);


--
-- TOC entry 3864 (class 1259 OID 172102)
-- Name: dk_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_item_1 ON public.item USING btree (item_desc);


--
-- TOC entry 3865 (class 1259 OID 172103)
-- Name: dk_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_item_2 ON public.item USING btree (category_id);


--
-- TOC entry 3866 (class 1259 OID 172104)
-- Name: dk_item_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_item_3 ON public.item USING btree (sku_code);


--
-- TOC entry 3747 (class 1259 OID 24885)
-- Name: dk_item_location_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_item_location_1 ON public.item_location USING btree (inventory_id, location_id);


--
-- TOC entry 3875 (class 1259 OID 188453)
-- Name: dk_itembatch_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_itembatch_1 ON public.itembatch USING btree (item_id, inventory_id);


--
-- TOC entry 3876 (class 1259 OID 188454)
-- Name: dk_itembatch_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_itembatch_2 ON public.itembatch USING btree (batch_no, inventory_id);


--
-- TOC entry 3877 (class 1259 OID 188455)
-- Name: dk_itembatch_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_itembatch_3 ON public.itembatch USING btree (item_id, expiry_date) WHERE ((status_code = 'A'::bpchar) AND (expiry_date IS NOT NULL));


--
-- TOC entry 3878 (class 1259 OID 188456)
-- Name: dk_itembatch_4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_itembatch_4 ON public.itembatch USING btree (item_id, batch_date) WHERE (status_code = 'A'::bpchar);


--
-- TOC entry 3744 (class 1259 OID 24869)
-- Name: dk_location_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_location_1 ON public.location USING btree (inventory_id);


--
-- TOC entry 3766 (class 1259 OID 25098)
-- Name: dk_reliefpkg_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_1 ON public.reliefpkg USING btree (start_date);


--
-- TOC entry 3767 (class 1259 OID 25099)
-- Name: dk_reliefpkg_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_3 ON public.reliefpkg USING btree (to_inventory_id);


--
-- TOC entry 3896 (class 1259 OID 204823)
-- Name: dk_reliefpkg_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_item_1 ON public.reliefpkg_item USING btree (fr_inventory_id, item_id);


--
-- TOC entry 3897 (class 1259 OID 204824)
-- Name: dk_reliefpkg_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_item_2 ON public.reliefpkg_item USING btree (item_id);


--
-- TOC entry 3898 (class 1259 OID 204825)
-- Name: dk_reliefpkg_item_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_item_3 ON public.reliefpkg_item USING btree (batch_id);


--
-- TOC entry 3761 (class 1259 OID 25046)
-- Name: dk_reliefrqst_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefrqst_1 ON public.reliefrqst USING btree (agency_id, request_date);


--
-- TOC entry 3762 (class 1259 OID 57350)
-- Name: dk_reliefrqst_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefrqst_2 ON public.reliefrqst USING btree (request_date, status_code);


--
-- TOC entry 3763 (class 1259 OID 57351)
-- Name: dk_reliefrqst_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefrqst_3 ON public.reliefrqst USING btree (status_code, urgency_ind);


--
-- TOC entry 3848 (class 1259 OID 98316)
-- Name: dk_reliefrqst_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefrqst_item_2 ON public.reliefrqst_item USING btree (item_id, urgency_ind);


--
-- TOC entry 3827 (class 1259 OID 32918)
-- Name: dk_rtintake_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_rtintake_item_1 ON public.rtintake_item USING btree (inventory_id, item_id);


--
-- TOC entry 3828 (class 1259 OID 32919)
-- Name: dk_rtintake_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_rtintake_item_2 ON public.rtintake_item USING btree (item_id);


--
-- TOC entry 3756 (class 1259 OID 25008)
-- Name: dk_transfer_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_1 ON public.transfer USING btree (transfer_date);


--
-- TOC entry 3757 (class 1259 OID 25009)
-- Name: dk_transfer_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_2 ON public.transfer USING btree (fr_inventory_id);


--
-- TOC entry 3758 (class 1259 OID 25010)
-- Name: dk_transfer_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_3 ON public.transfer USING btree (to_inventory_id);


--
-- TOC entry 3891 (class 1259 OID 196635)
-- Name: dk_transfer_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_item_1 ON public.transfer_item USING btree (inventory_id, item_id);


--
-- TOC entry 3892 (class 1259 OID 196636)
-- Name: dk_transfer_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_item_2 ON public.transfer_item USING btree (item_id);


--
-- TOC entry 3893 (class 1259 OID 196637)
-- Name: dk_transfer_item_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_item_3 ON public.transfer_item USING btree (batch_id);


--
-- TOC entry 3787 (class 1259 OID 40979)
-- Name: dk_user_agency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_user_agency_id ON public."user" USING btree (agency_id);


--
-- TOC entry 3814 (class 1259 OID 32819)
-- Name: dk_xfintake_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_xfintake_item_1 ON public.xfintake_item USING btree (inventory_id, item_id);


--
-- TOC entry 3815 (class 1259 OID 32820)
-- Name: dk_xfintake_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_xfintake_item_2 ON public.xfintake_item USING btree (item_id);


--
-- TOC entry 3818 (class 1259 OID 32841)
-- Name: dk_xfreturn_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_xfreturn_1 ON public.xfreturn USING btree (return_date);


--
-- TOC entry 3819 (class 1259 OID 32842)
-- Name: dk_xfreturn_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_xfreturn_2 ON public.xfreturn USING btree (fr_inventory_id);


--
-- TOC entry 3820 (class 1259 OID 32843)
-- Name: dk_xfreturn_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_xfreturn_3 ON public.xfreturn USING btree (to_inventory_id);


--
-- TOC entry 3780 (class 1259 OID 25389)
-- Name: idx_distribution_package_agency; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_agency ON public.distribution_package USING btree (recipient_agency_id);


--
-- TOC entry 3781 (class 1259 OID 25391)
-- Name: idx_distribution_package_event; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_event ON public.distribution_package USING btree (event_id);


--
-- TOC entry 3785 (class 1259 OID 25412)
-- Name: idx_distribution_package_item_item; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_item_item ON public.distribution_package_item USING btree (item_id);


--
-- TOC entry 3786 (class 1259 OID 25411)
-- Name: idx_distribution_package_item_package; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_item_package ON public.distribution_package_item USING btree (package_id);


--
-- TOC entry 3782 (class 1259 OID 25390)
-- Name: idx_distribution_package_warehouse; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_warehouse ON public.distribution_package USING btree (assigned_warehouse_id);


--
-- TOC entry 3853 (class 1259 OID 106514)
-- Name: idx_fulfillment_lock_expires; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fulfillment_lock_expires ON public.relief_request_fulfillment_lock USING btree (expires_at) WHERE (expires_at IS NOT NULL);


--
-- TOC entry 3854 (class 1259 OID 106513)
-- Name: idx_fulfillment_lock_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fulfillment_lock_user ON public.relief_request_fulfillment_lock USING btree (fulfiller_user_id);


--
-- TOC entry 3859 (class 1259 OID 131109)
-- Name: idx_itemcatg_status_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_itemcatg_status_code ON public.itemcatg USING btree (status_code);


--
-- TOC entry 3804 (class 1259 OID 25527)
-- Name: idx_notification_user_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notification_user_status ON public.notification USING btree (user_id, status, created_at);


--
-- TOC entry 3805 (class 1259 OID 25528)
-- Name: idx_notification_warehouse; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notification_warehouse ON public.notification USING btree (warehouse_id, created_at);


--
-- TOC entry 3793 (class 1259 OID 25457)
-- Name: idx_role_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_role_code ON public.role USING btree (code);


--
-- TOC entry 3844 (class 1259 OID 65597)
-- Name: ix_role_permission_perm_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_role_permission_perm_id ON public.role_permission USING btree (perm_id);


--
-- TOC entry 3845 (class 1259 OID 65596)
-- Name: ix_role_permission_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_role_permission_role_id ON public.role_permission USING btree (role_id);


--
-- TOC entry 3798 (class 1259 OID 65609)
-- Name: ix_user_role_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_user_role_role_id ON public.user_role USING btree (role_id);


--
-- TOC entry 3799 (class 1259 OID 65608)
-- Name: ix_user_role_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_user_role_user_id ON public.user_role USING btree (user_id);


--
-- TOC entry 3834 (class 1259 OID 49184)
-- Name: uk_aar_active_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_aar_active_email ON public.agency_account_request USING btree (lower((contact_email)::text)) WHERE (status_code = ANY (ARRAY['S'::bpchar, 'R'::bpchar]));


--
-- TOC entry 3743 (class 1259 OID 237609)
-- Name: uk_inventory_1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_inventory_1 ON public.inventory USING btree (item_id, inventory_id) WHERE (usable_qty > 0.00);


--
-- TOC entry 3881 (class 1259 OID 188452)
-- Name: uk_itembatch_1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_itembatch_1 ON public.itembatch USING btree (inventory_id, batch_no, item_id);


--
-- TOC entry 3882 (class 1259 OID 188483)
-- Name: uk_itembatch_inventory_batch; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_itembatch_inventory_batch ON public.itembatch USING btree (inventory_id, batch_id);


--
-- TOC entry 3883 (class 1259 OID 204800)
-- Name: uk_itembatch_inventory_batch_item; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_itembatch_inventory_batch_item ON public.itembatch USING btree (inventory_id, batch_id, item_id);


--
-- TOC entry 3788 (class 1259 OID 40978)
-- Name: uk_user_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_user_username ON public."user" USING btree (username);


--
-- TOC entry 4014 (class 2620 OID 49186)
-- Name: agency_account_request trg_aar_set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_aar_set_updated_at BEFORE UPDATE ON public.agency_account_request FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- TOC entry 4013 (class 2620 OID 40981)
-- Name: user trg_user_set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_user_set_updated_at BEFORE UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- TOC entry 3905 (class 2606 OID 114701)
-- Name: agency agency_ineligible_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT agency_ineligible_event_id_fkey FOREIGN KEY (ineligible_event_id) REFERENCES public.event(event_id);


--
-- TOC entry 3906 (class 2606 OID 24818)
-- Name: agency agency_parish_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT agency_parish_code_fkey FOREIGN KEY (parish_code) REFERENCES public.parish(parish_code);


--
-- TOC entry 3932 (class 2606 OID 25149)
-- Name: dbintake_item dbintake_item_location1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_location1_id_fkey FOREIGN KEY (location1_id) REFERENCES public.location(location_id);


--
-- TOC entry 3933 (class 2606 OID 25154)
-- Name: dbintake_item dbintake_item_location2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_location2_id_fkey FOREIGN KEY (location2_id) REFERENCES public.location(location_id);


--
-- TOC entry 3934 (class 2606 OID 25159)
-- Name: dbintake_item dbintake_item_location3_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_location3_id_fkey FOREIGN KEY (location3_id) REFERENCES public.location(location_id);


--
-- TOC entry 3935 (class 2606 OID 25169)
-- Name: dbintake_item dbintake_item_reliefpkg_id_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_reliefpkg_id_inventory_id_fkey FOREIGN KEY (reliefpkg_id, inventory_id) REFERENCES public.dbintake(reliefpkg_id, inventory_id);


--
-- TOC entry 3936 (class 2606 OID 25164)
-- Name: dbintake_item dbintake_item_uom_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_uom_code_fkey FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3930 (class 2606 OID 25130)
-- Name: dbintake dbintake_reliefpkg_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake
    ADD CONSTRAINT dbintake_reliefpkg_id_fkey FOREIGN KEY (reliefpkg_id) REFERENCES public.reliefpkg(reliefpkg_id);


--
-- TOC entry 3937 (class 2606 OID 25379)
-- Name: distribution_package distribution_package_assigned_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_assigned_warehouse_id_fkey FOREIGN KEY (assigned_warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3938 (class 2606 OID 114706)
-- Name: distribution_package distribution_package_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- TOC entry 3940 (class 2606 OID 172148)
-- Name: distribution_package_item distribution_package_item_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package_item
    ADD CONSTRAINT distribution_package_item_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- TOC entry 3941 (class 2606 OID 25401)
-- Name: distribution_package_item distribution_package_item_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package_item
    ADD CONSTRAINT distribution_package_item_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.distribution_package(id) ON DELETE CASCADE;


--
-- TOC entry 3939 (class 2606 OID 25374)
-- Name: distribution_package distribution_package_recipient_agency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_recipient_agency_id_fkey FOREIGN KEY (recipient_agency_id) REFERENCES public.agency(agency_id);


--
-- TOC entry 3920 (class 2606 OID 24942)
-- Name: dnintake dnintake_donation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake
    ADD CONSTRAINT dnintake_donation_id_fkey FOREIGN KEY (donation_id) REFERENCES public.donation(donation_id);


--
-- TOC entry 3914 (class 2606 OID 24906)
-- Name: donation donation_custodian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_custodian_id_fkey FOREIGN KEY (custodian_id) REFERENCES public.custodian(custodian_id);


--
-- TOC entry 3915 (class 2606 OID 24896)
-- Name: donation donation_donor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_donor_id_fkey FOREIGN KEY (donor_id) REFERENCES public.donor(donor_id);


--
-- TOC entry 3916 (class 2606 OID 114711)
-- Name: donation donation_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- TOC entry 3917 (class 2606 OID 24920)
-- Name: donation_item donation_item_donation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation_item
    ADD CONSTRAINT donation_item_donation_id_fkey FOREIGN KEY (donation_id) REFERENCES public.donation(donation_id);


--
-- TOC entry 3918 (class 2606 OID 172143)
-- Name: donation_item donation_item_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation_item
    ADD CONSTRAINT donation_item_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- TOC entry 3919 (class 2606 OID 24930)
-- Name: donation_item donation_item_uom_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation_item
    ADD CONSTRAINT donation_item_uom_code_fkey FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3901 (class 2606 OID 24734)
-- Name: donor donor_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT donor_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- TOC entry 3985 (class 2606 OID 49200)
-- Name: agency_account_request_audit fk_aar_actor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request_audit
    ADD CONSTRAINT fk_aar_actor FOREIGN KEY (actor_user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3981 (class 2606 OID 49164)
-- Name: agency_account_request fk_aar_agency; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT fk_aar_agency FOREIGN KEY (agency_id) REFERENCES public.agency(agency_id);


--
-- TOC entry 3986 (class 2606 OID 49195)
-- Name: agency_account_request_audit fk_aar_audit_req; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request_audit
    ADD CONSTRAINT fk_aar_audit_req FOREIGN KEY (request_id) REFERENCES public.agency_account_request(request_id);


--
-- TOC entry 3982 (class 2606 OID 49174)
-- Name: agency_account_request fk_aar_created_by; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT fk_aar_created_by FOREIGN KEY (created_by_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3983 (class 2606 OID 49179)
-- Name: agency_account_request fk_aar_updated_by; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT fk_aar_updated_by FOREIGN KEY (updated_by_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3984 (class 2606 OID 49169)
-- Name: agency_account_request fk_aar_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT fk_aar_user FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3907 (class 2606 OID 32976)
-- Name: agency fk_agency_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT fk_agency_warehouse FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3999 (class 2606 OID 188504)
-- Name: batchlocation fk_batchlocation_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT fk_batchlocation_inventory FOREIGN KEY (inventory_id, batch_id) REFERENCES public.itembatch(inventory_id, batch_id);


--
-- TOC entry 4000 (class 2606 OID 188499)
-- Name: batchlocation fk_batchlocation_itembatch; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT fk_batchlocation_itembatch FOREIGN KEY (batch_id) REFERENCES public.itembatch(batch_id);


--
-- TOC entry 4001 (class 2606 OID 188494)
-- Name: batchlocation fk_batchlocation_location; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT fk_batchlocation_location FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- TOC entry 4002 (class 2606 OID 188489)
-- Name: batchlocation fk_batchlocation_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT fk_batchlocation_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3902 (class 2606 OID 24752)
-- Name: custodian fk_custodian_parish; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custodian
    ADD CONSTRAINT fk_custodian_parish FOREIGN KEY (parish_code) REFERENCES public.parish(parish_code);


--
-- TOC entry 3931 (class 2606 OID 237616)
-- Name: dbintake fk_dbintake_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake
    ADD CONSTRAINT fk_dbintake_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 4003 (class 2606 OID 188534)
-- Name: dnintake_item fk_dnintake_item_donation_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake_item
    ADD CONSTRAINT fk_dnintake_item_donation_item FOREIGN KEY (donation_id, item_id) REFERENCES public.donation_item(donation_id, item_id);


--
-- TOC entry 4004 (class 2606 OID 188529)
-- Name: dnintake_item fk_dnintake_item_intake; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake_item
    ADD CONSTRAINT fk_dnintake_item_intake FOREIGN KEY (donation_id, inventory_id) REFERENCES public.dnintake(donation_id, inventory_id);


--
-- TOC entry 4005 (class 2606 OID 188524)
-- Name: dnintake_item fk_dnintake_item_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake_item
    ADD CONSTRAINT fk_dnintake_item_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3921 (class 2606 OID 237621)
-- Name: dnintake fk_dnintake_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake
    ADD CONSTRAINT fk_dnintake_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3908 (class 2606 OID 237592)
-- Name: inventory fk_inventory_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fk_inventory_item FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- TOC entry 3909 (class 2606 OID 237597)
-- Name: inventory fk_inventory_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fk_inventory_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3910 (class 2606 OID 237587)
-- Name: inventory fk_inventory_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fk_inventory_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3994 (class 2606 OID 172092)
-- Name: item fk_item_itemcatg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_item_itemcatg FOREIGN KEY (category_id) REFERENCES public.itemcatg(category_id);


--
-- TOC entry 3912 (class 2606 OID 237671)
-- Name: item_location fk_item_location_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_location
    ADD CONSTRAINT fk_item_location_inventory FOREIGN KEY (inventory_id, item_id) REFERENCES public.inventory(inventory_id, item_id);


--
-- TOC entry 3995 (class 2606 OID 172097)
-- Name: item fk_item_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_item_unitofmeasure FOREIGN KEY (default_uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3996 (class 2606 OID 188442)
-- Name: itembatch fk_itembatch_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itembatch
    ADD CONSTRAINT fk_itembatch_item FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- TOC entry 3997 (class 2606 OID 188447)
-- Name: itembatch fk_itembatch_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itembatch
    ADD CONSTRAINT fk_itembatch_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3998 (class 2606 OID 237661)
-- Name: itembatch fk_itembatch_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itembatch
    ADD CONSTRAINT fk_itembatch_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3911 (class 2606 OID 237656)
-- Name: location fk_location_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT fk_location_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 4010 (class 2606 OID 204818)
-- Name: reliefpkg_item fk_reliefpkg_item_itembatch; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg_item
    ADD CONSTRAINT fk_reliefpkg_item_itembatch FOREIGN KEY (fr_inventory_id, batch_id, item_id) REFERENCES public.itembatch(inventory_id, batch_id, item_id);


--
-- TOC entry 4011 (class 2606 OID 204808)
-- Name: reliefpkg_item fk_reliefpkg_item_reliefpkg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg_item
    ADD CONSTRAINT fk_reliefpkg_item_reliefpkg FOREIGN KEY (reliefpkg_id) REFERENCES public.reliefpkg(reliefpkg_id);


--
-- TOC entry 4012 (class 2606 OID 204813)
-- Name: reliefpkg_item fk_reliefpkg_item_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg_item
    ADD CONSTRAINT fk_reliefpkg_item_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3928 (class 2606 OID 237611)
-- Name: reliefpkg fk_reliefpkg_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg
    ADD CONSTRAINT fk_reliefpkg_warehouse FOREIGN KEY (to_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3925 (class 2606 OID 25041)
-- Name: reliefrqst fk_reliefrqst_agency; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst
    ADD CONSTRAINT fk_reliefrqst_agency FOREIGN KEY (agency_id) REFERENCES public.agency(agency_id);


--
-- TOC entry 3926 (class 2606 OID 114716)
-- Name: reliefrqst fk_reliefrqst_event; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst
    ADD CONSTRAINT fk_reliefrqst_event FOREIGN KEY (eligible_event_id) REFERENCES public.event(event_id);


--
-- TOC entry 3989 (class 2606 OID 172163)
-- Name: reliefrqst_item fk_reliefrqst_item_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_item
    ADD CONSTRAINT fk_reliefrqst_item_item FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- TOC entry 3990 (class 2606 OID 90132)
-- Name: reliefrqst_item fk_reliefrqst_item_reliefrqst; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_item
    ADD CONSTRAINT fk_reliefrqst_item_reliefrqst FOREIGN KEY (reliefrqst_id) REFERENCES public.reliefrqst(reliefrqst_id);


--
-- TOC entry 3991 (class 2606 OID 98311)
-- Name: reliefrqst_item fk_reliefrqst_item_reliefrqstitem_status; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_item
    ADD CONSTRAINT fk_reliefrqst_item_reliefrqstitem_status FOREIGN KEY (status_code) REFERENCES public.reliefrqstitem_status(status_code);


--
-- TOC entry 3927 (class 2606 OID 57355)
-- Name: reliefrqst fk_reliefrqst_reliefrqst_status; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst
    ADD CONSTRAINT fk_reliefrqst_reliefrqst_status FOREIGN KEY (status_code) REFERENCES public.reliefrqst_status(status_code);


--
-- TOC entry 3987 (class 2606 OID 65591)
-- Name: role_permission fk_role_permission_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT fk_role_permission_perm FOREIGN KEY (perm_id) REFERENCES public.permission(perm_id);


--
-- TOC entry 3988 (class 2606 OID 65586)
-- Name: role_permission fk_role_permission_role; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT fk_role_permission_role FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 3976 (class 2606 OID 32913)
-- Name: rtintake_item fk_rtintake_item_intake; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT fk_rtintake_item_intake FOREIGN KEY (xfreturn_id, inventory_id) REFERENCES public.rtintake(xfreturn_id, inventory_id);


--
-- TOC entry 3974 (class 2606 OID 237626)
-- Name: rtintake fk_rtintake_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake
    ADD CONSTRAINT fk_rtintake_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3922 (class 2606 OID 237636)
-- Name: transfer fk_transfer_fr_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_fr_warehouse FOREIGN KEY (fr_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 4006 (class 2606 OID 237666)
-- Name: transfer_item fk_transfer_item_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_item
    ADD CONSTRAINT fk_transfer_item_inventory FOREIGN KEY (inventory_id, item_id) REFERENCES public.inventory(inventory_id, item_id);


--
-- TOC entry 4007 (class 2606 OID 196630)
-- Name: transfer_item fk_transfer_item_itembatch; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_item
    ADD CONSTRAINT fk_transfer_item_itembatch FOREIGN KEY (inventory_id, batch_id) REFERENCES public.itembatch(inventory_id, batch_id);


--
-- TOC entry 4008 (class 2606 OID 196615)
-- Name: transfer_item fk_transfer_item_transfer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_item
    ADD CONSTRAINT fk_transfer_item_transfer FOREIGN KEY (transfer_id) REFERENCES public.transfer(transfer_id);


--
-- TOC entry 4009 (class 2606 OID 196620)
-- Name: transfer_item fk_transfer_item_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_item
    ADD CONSTRAINT fk_transfer_item_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3923 (class 2606 OID 237641)
-- Name: transfer fk_transfer_to_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_to_warehouse FOREIGN KEY (to_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3964 (class 2606 OID 32814)
-- Name: xfintake_item fk_xfintake_item_intake; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake_item
    ADD CONSTRAINT fk_xfintake_item_intake FOREIGN KEY (transfer_id, inventory_id) REFERENCES public.xfintake(transfer_id, inventory_id);


--
-- TOC entry 3962 (class 2606 OID 237631)
-- Name: xfintake fk_xfintake_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake
    ADD CONSTRAINT fk_xfintake_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3969 (class 2606 OID 237646)
-- Name: xfreturn fk_xfreturn_fr_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn
    ADD CONSTRAINT fk_xfreturn_fr_warehouse FOREIGN KEY (fr_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3971 (class 2606 OID 237676)
-- Name: xfreturn_item fk_xfreturn_item_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn_item
    ADD CONSTRAINT fk_xfreturn_item_inventory FOREIGN KEY (inventory_id, item_id) REFERENCES public.inventory(inventory_id, item_id);


--
-- TOC entry 3970 (class 2606 OID 237651)
-- Name: xfreturn fk_xfreturn_to_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn
    ADD CONSTRAINT fk_xfreturn_to_warehouse FOREIGN KEY (to_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3913 (class 2606 OID 24875)
-- Name: item_location item_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_location
    ADD CONSTRAINT item_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- TOC entry 3950 (class 2606 OID 25522)
-- Name: notification notification_reliefrqst_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_reliefrqst_id_fkey FOREIGN KEY (reliefrqst_id) REFERENCES public.reliefrqst(reliefrqst_id);


--
-- TOC entry 3951 (class 2606 OID 25512)
-- Name: notification notification_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3952 (class 2606 OID 25517)
-- Name: notification notification_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3992 (class 2606 OID 106508)
-- Name: relief_request_fulfillment_lock relief_request_fulfillment_lock_fulfiller_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relief_request_fulfillment_lock
    ADD CONSTRAINT relief_request_fulfillment_lock_fulfiller_user_id_fkey FOREIGN KEY (fulfiller_user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 3993 (class 2606 OID 106503)
-- Name: relief_request_fulfillment_lock relief_request_fulfillment_lock_reliefrqst_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relief_request_fulfillment_lock
    ADD CONSTRAINT relief_request_fulfillment_lock_reliefrqst_id_fkey FOREIGN KEY (reliefrqst_id) REFERENCES public.reliefrqst(reliefrqst_id) ON DELETE CASCADE;


--
-- TOC entry 3929 (class 2606 OID 25093)
-- Name: reliefpkg reliefpkg_reliefrqst_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg
    ADD CONSTRAINT reliefpkg_reliefrqst_id_fkey FOREIGN KEY (reliefrqst_id) REFERENCES public.reliefrqst(reliefrqst_id);


--
-- TOC entry 3977 (class 2606 OID 32893)
-- Name: rtintake_item rtintake_item_location1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT rtintake_item_location1_id_fkey FOREIGN KEY (location1_id) REFERENCES public.location(location_id);


--
-- TOC entry 3978 (class 2606 OID 32898)
-- Name: rtintake_item rtintake_item_location2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT rtintake_item_location2_id_fkey FOREIGN KEY (location2_id) REFERENCES public.location(location_id);


--
-- TOC entry 3979 (class 2606 OID 32903)
-- Name: rtintake_item rtintake_item_location3_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT rtintake_item_location3_id_fkey FOREIGN KEY (location3_id) REFERENCES public.location(location_id);


--
-- TOC entry 3980 (class 2606 OID 32908)
-- Name: rtintake_item rtintake_item_uom_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT rtintake_item_uom_code_fkey FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3975 (class 2606 OID 32874)
-- Name: rtintake rtintake_xfreturn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake
    ADD CONSTRAINT rtintake_xfreturn_id_fkey FOREIGN KEY (xfreturn_id) REFERENCES public.xfreturn(xfreturn_id);


--
-- TOC entry 3958 (class 2606 OID 25585)
-- Name: transaction transaction_donor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_donor_id_fkey FOREIGN KEY (donor_id) REFERENCES public.donor(donor_id);


--
-- TOC entry 3959 (class 2606 OID 114721)
-- Name: transaction transaction_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- TOC entry 3960 (class 2606 OID 172158)
-- Name: transaction transaction_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- TOC entry 3961 (class 2606 OID 25580)
-- Name: transaction transaction_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3924 (class 2606 OID 114726)
-- Name: transfer transfer_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT transfer_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- TOC entry 3953 (class 2606 OID 25540)
-- Name: transfer_request transfer_request_from_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_from_warehouse_id_fkey FOREIGN KEY (from_warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3954 (class 2606 OID 172153)
-- Name: transfer_request transfer_request_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- TOC entry 3955 (class 2606 OID 25555)
-- Name: transfer_request transfer_request_requested_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_requested_by_fkey FOREIGN KEY (requested_by) REFERENCES public."user"(user_id);


--
-- TOC entry 3956 (class 2606 OID 25560)
-- Name: transfer_request transfer_request_reviewed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES public."user"(user_id);


--
-- TOC entry 3957 (class 2606 OID 25545)
-- Name: transfer_request transfer_request_to_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_to_warehouse_id_fkey FOREIGN KEY (to_warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3942 (class 2606 OID 40973)
-- Name: user user_agency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_agency_id_fkey FOREIGN KEY (agency_id) REFERENCES public.agency(agency_id);


--
-- TOC entry 3943 (class 2606 OID 25429)
-- Name: user user_assigned_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_assigned_warehouse_id_fkey FOREIGN KEY (assigned_warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3944 (class 2606 OID 25474)
-- Name: user_role user_role_assigned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_assigned_by_fkey FOREIGN KEY (assigned_by) REFERENCES public."user"(user_id);


--
-- TOC entry 3945 (class 2606 OID 25469)
-- Name: user_role user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id) ON DELETE CASCADE;


--
-- TOC entry 3946 (class 2606 OID 25464)
-- Name: user_role user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 3947 (class 2606 OID 25495)
-- Name: user_warehouse user_warehouse_assigned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_warehouse
    ADD CONSTRAINT user_warehouse_assigned_by_fkey FOREIGN KEY (assigned_by) REFERENCES public."user"(user_id);


--
-- TOC entry 3948 (class 2606 OID 25485)
-- Name: user_warehouse user_warehouse_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_warehouse
    ADD CONSTRAINT user_warehouse_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 3949 (class 2606 OID 25490)
-- Name: user_warehouse user_warehouse_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_warehouse
    ADD CONSTRAINT user_warehouse_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id) ON DELETE CASCADE;


--
-- TOC entry 3903 (class 2606 OID 24801)
-- Name: warehouse warehouse_custodian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_custodian_id_fkey FOREIGN KEY (custodian_id) REFERENCES public.custodian(custodian_id);


--
-- TOC entry 3904 (class 2606 OID 24796)
-- Name: warehouse warehouse_parish_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_parish_code_fkey FOREIGN KEY (parish_code) REFERENCES public.parish(parish_code);


--
-- TOC entry 3965 (class 2606 OID 32794)
-- Name: xfintake_item xfintake_item_location1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake_item
    ADD CONSTRAINT xfintake_item_location1_id_fkey FOREIGN KEY (location1_id) REFERENCES public.location(location_id);


--
-- TOC entry 3966 (class 2606 OID 32799)
-- Name: xfintake_item xfintake_item_location2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake_item
    ADD CONSTRAINT xfintake_item_location2_id_fkey FOREIGN KEY (location2_id) REFERENCES public.location(location_id);


--
-- TOC entry 3967 (class 2606 OID 32804)
-- Name: xfintake_item xfintake_item_location3_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake_item
    ADD CONSTRAINT xfintake_item_location3_id_fkey FOREIGN KEY (location3_id) REFERENCES public.location(location_id);


--
-- TOC entry 3968 (class 2606 OID 32809)
-- Name: xfintake_item xfintake_item_uom_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake_item
    ADD CONSTRAINT xfintake_item_uom_code_fkey FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3963 (class 2606 OID 32775)
-- Name: xfintake xfintake_transfer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfintake
    ADD CONSTRAINT xfintake_transfer_id_fkey FOREIGN KEY (transfer_id) REFERENCES public.transfer(transfer_id);


--
-- TOC entry 3972 (class 2606 OID 32857)
-- Name: xfreturn_item xfreturn_item_uom_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn_item
    ADD CONSTRAINT xfreturn_item_uom_code_fkey FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- TOC entry 3973 (class 2606 OID 32852)
-- Name: xfreturn_item xfreturn_item_xfreturn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn_item
    ADD CONSTRAINT xfreturn_item_xfreturn_id_fkey FOREIGN KEY (xfreturn_id) REFERENCES public.xfreturn(xfreturn_id);


-- Completed on 2025-11-17 19:38:32 UTC

--
-- PostgreSQL database dump complete
--

