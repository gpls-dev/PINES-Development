--002.schema.config.sql:
INSERT INTO config.bib_source (id, quality, source, transcendant) VALUES 
    (1, 90, oils_i18n_gettext(1, 'oclc', 'cbs', 'source'), FALSE);
INSERT INTO config.bib_source (id, quality, source, transcendant) VALUES 
    (2, 10, oils_i18n_gettext(2, 'System Local', 'cbs', 'source'), FALSE);
INSERT INTO config.bib_source (id, quality, source, transcendant) VALUES 
    (3, 1, oils_i18n_gettext(3, 'Project Gutenberg', 'cbs', 'source'), TRUE);
SELECT SETVAL('config.bib_source_id_seq'::TEXT, 100);

INSERT INTO config.standing (id, value) VALUES (1, oils_i18n_gettext(1, 'Good', 'cst', 'value'));
INSERT INTO config.standing (id, value) VALUES (2, oils_i18n_gettext(2, 'Barred', 'cst', 'value'));
SELECT SETVAL('config.standing_id_seq'::TEXT, 100);

INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'series', 'seriestitle', 'mods32', $$//mods32:mods/mods32:relatedItem[@type="series"]/mods32:titleInfo$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'title', 'abbreviated', 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and (@type='abbreviated')]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'title', 'translated', 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and (@type='translated')]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'title', 'alternative', 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and (@type='alternative')]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'title', 'uniform', 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and (@type='uniform')]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'title', 'proper', 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and not (@type)]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'author', 'corporate', 'mods32', $$//mods32:mods/mods32:name[@type='corporate']/mods32:namePart[../mods32:role/mods32:roleTerm[text()='creator']]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'author', 'personal', 'mods32', $$//mods32:mods/mods32:name[@type='personal']/mods32:namePart[../mods32:role/mods32:roleTerm[text()='creator']]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'author', 'conference', 'mods32', $$//mods32:mods/mods32:name[@type='conference']/mods32:namePart[../mods32:role/mods32:roleTerm[text()='creator']]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'author', 'other', 'mods32', $$//mods32:mods/mods32:name[@type='personal']/mods32:namePart[not(../mods32:role)]$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'subject', 'geographic', 'mods32', $$//mods32:mods/mods32:subject/mods32:geographic$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'subject', 'name', 'mods32', $$//mods32:mods/mods32:subject/mods32:name$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'subject', 'temporal', 'mods32', $$//mods32:mods/mods32:subject/mods32:temporal$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'subject', 'topic', 'mods32', $$//mods32:mods/mods32:subject/mods32:topic$$ );
--INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
--  ( field_class, name, xpath ) VALUES ( 'subject', 'genre', 'mods32', $$//mods32:mods/mods32:genre$$ );
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES 
    ( 'keyword', 'keyword', 'mods32', $$//mods32:mods/*[not(local-name()='originInfo')]$$ ); -- /* to fool vim */;
INSERT INTO config.metabib_field ( field_class, name, format, xpath ) VALUES
    ( 'subject', 'complete', 'mods32', $$//mods32:mods/mods32:subject//text()$$ );

INSERT INTO config.non_cataloged_type ( id, owning_lib, name ) VALUES ( 1, 1, oils_i18n_gettext(1, 'Paperback Book', 'cnct', 'name') );
SELECT SETVAL('config.non_cataloged_type_id_seq'::TEXT, 100);

INSERT INTO config.identification_type ( id, name ) VALUES 
    ( 1, oils_i18n_gettext(1, 'Drivers License', 'cit', 'name') );
INSERT INTO config.identification_type ( id, name ) VALUES 
    ( 2, oils_i18n_gettext(2, 'SSN', 'cit', 'name') );
INSERT INTO config.identification_type ( id, name ) VALUES 
    ( 3, oils_i18n_gettext(3, 'Other', 'cit', 'name') );
SELECT SETVAL('config.identification_type_id_seq'::TEXT, 100);

INSERT INTO config.rule_circ_duration VALUES 
    (1, oils_i18n_gettext(1, '7_days_0_renew', 'crcd', 'name'), '7 days', '7 days', '7 days', 0);
INSERT INTO config.rule_circ_duration VALUES 
    (2, oils_i18n_gettext(2, '28_days_2_renew', 'crcd', 'name'), '28 days', '28 days', '28 days', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (3, oils_i18n_gettext(3, '3_months_0_renew', 'crcd', 'name'), '3 months', '3 months', '3 months', 0);
INSERT INTO config.rule_circ_duration VALUES 
    (4, oils_i18n_gettext(4, '3_days_1_renew', 'crcd', 'name'), '3 days', '3 days', '3 days', 1);
INSERT INTO config.rule_circ_duration VALUES 
    (5, oils_i18n_gettext(5, '2_months_2_renew', 'crcd', 'name'), '2 months', '2 months', '2 months', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (6, oils_i18n_gettext(6, '35_days_1_renew', 'crcd', 'name'), '35 days', '35 days', '35 days', 1);
INSERT INTO config.rule_circ_duration VALUES 
    (7, oils_i18n_gettext(7, '7_days_2_renew', 'crcd', 'name'), '7 days', '7 days', '7 days', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (8, oils_i18n_gettext(8, '1_hour_2_renew', 'crcd', 'name'), '1 hour', '1 hour', '1 hour', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (9, oils_i18n_gettext(9, '28_days_0_renew', 'crcd', 'name'), '28 days', '28 days', '28 days', 0);
INSERT INTO config.rule_circ_duration VALUES 
    (10, oils_i18n_gettext(10, '14_days_2_renew', 'crcd', 'name'), '14 days', '14 days', '14 days', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (11, oils_i18n_gettext(11, 'default', 'crcd', 'name'), '21 days', '14 days', '7 days', 2);
SELECT SETVAL('config.rule_circ_duration_id_seq'::TEXT, 100);

INSERT INTO config.rule_max_fine VALUES 
    (1, oils_i18n_gettext(1, 'default', 'crmf', 'name'), 5.00);
INSERT INTO config.rule_max_fine VALUES 
    (2, oils_i18n_gettext(2, 'overdue_min', 'crmf', 'name'), 5.00);
INSERT INTO config.rule_max_fine VALUES 
    (3, oils_i18n_gettext(3, 'overdue_mid', 'crmf', 'name'), 10.00);
INSERT INTO config.rule_max_fine VALUES 
    (4, oils_i18n_gettext(4, 'overdue_max', 'crmf', 'name'), 100.00);
INSERT INTO config.rule_max_fine VALUES 
    (5, oils_i18n_gettext(5, 'overdue_equip_min', 'crmf', 'name'), 25.00);
INSERT INTO config.rule_max_fine VALUES 
    (6, oils_i18n_gettext(6, 'overdue_equip_mid', 'crmf', 'name'), 25.00);
INSERT INTO config.rule_max_fine VALUES 
    (7, oils_i18n_gettext(7, 'overdue_equip_max', 'crmf', 'name'), 100.00);
SELECT SETVAL('config.rule_max_fine_id_seq'::TEXT, 100);

INSERT INTO config.rule_recuring_fine VALUES 
    (1, oils_i18n_gettext(1, 'default', 'crrf', 'name'), 0.50, 0.10, 0.05, '1 day');
INSERT INTO config.rule_recuring_fine VALUES 
    (2, oils_i18n_gettext(2, '10_cent_per_day', 'crrf', 'name'), 0.50, 0.10, 0.10, '1 day');
INSERT INTO config.rule_recuring_fine VALUES 
    (3, oils_i18n_gettext(3, '50_cent_per_day', 'crrf', 'name'), 0.50, 0.50, 0.50, '1 day');
SELECT SETVAL('config.rule_recuring_fine_id_seq'::TEXT, 100);

INSERT INTO config.rule_age_hold_protect VALUES
	(1, oils_i18n_gettext(1, '3month', 'crahp', 'name'), '3 months', 0);
INSERT INTO config.rule_age_hold_protect VALUES
	(2, oils_i18n_gettext(2, '6month', 'crahp', 'name'), '6 months', 2);
SELECT SETVAL('config.rule_age_hold_protect_id_seq'::TEXT, 100);

INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (0,oils_i18n_gettext(0, 'Available', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (1,oils_i18n_gettext(1, 'Checked out', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name) VALUES (2,oils_i18n_gettext(2, 'Bindery', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name) VALUES (3,oils_i18n_gettext(3, 'Lost', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name) VALUES (4,oils_i18n_gettext(4, 'Missing', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (5,oils_i18n_gettext(5, 'In process', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (6,oils_i18n_gettext(6, 'In transit', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (7,oils_i18n_gettext(7, 'Reshelving', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (8,oils_i18n_gettext(8, 'On holds shelf', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (9,oils_i18n_gettext(9, 'On order', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name) VALUES (10,oils_i18n_gettext(10, 'ILL', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name) VALUES (11,oils_i18n_gettext(11, 'Cataloging', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name,opac_visible) VALUES (12,oils_i18n_gettext(12, 'Reserves', 'ccs', 'name'),'t');
INSERT INTO config.copy_status (id,name) VALUES (13,oils_i18n_gettext(13, 'Discard/Weed', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name) VALUES (14,oils_i18n_gettext(14, 'Damaged', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name) VALUES (15,oils_i18n_gettext(15, 'On reservation shelf', 'ccs', 'name'));

SELECT SETVAL('config.copy_status_id_seq'::TEXT, 100);

INSERT INTO config.net_access_level (id, name) VALUES 
    (1, oils_i18n_gettext(1, 'Filtered', 'cnal', 'name'));
INSERT INTO config.net_access_level (id, name) VALUES 
    (2, oils_i18n_gettext(2, 'Unfiltered', 'cnal', 'name'));
INSERT INTO config.net_access_level (id, name) VALUES 
    (3, oils_i18n_gettext(3, 'No Access', 'cnal', 'name'));
SELECT SETVAL('config.net_access_level_id_seq'::TEXT, 100);

INSERT INTO config.audience_map (code, value, description) VALUES 
    ('', oils_i18n_gettext('', 'Unknown or unspecified', 'cam', 'value'), 
	oils_i18n_gettext('', 'The target audience for the item not known or not specified.', 'cam', 'description'));
INSERT INTO config.audience_map (code, value, description) VALUES 
    ('a', oils_i18n_gettext('a', 'Preschool', 'cam', 'value'),
	oils_i18n_gettext('a', 'The item is intended for children, approximate ages 0-5 years.', 'cam', 'description'));
INSERT INTO config.audience_map (code, value, description) VALUES 
    ('b', oils_i18n_gettext('b', 'Primary', 'cam', 'value'),
	oils_i18n_gettext('b', 'The item is intended for children, approximate ages 6-8 years.', 'cam', 'description'));
INSERT INTO config.audience_map (code, value, description) VALUES 
    ('c', oils_i18n_gettext('c', 'Pre-adolescent', 'cam', 'value'),
	oils_i18n_gettext('c', 'The item is intended for young people, approximate ages 9-13 years.', 'cam', 'description'));
INSERT INTO config.audience_map (code, value, description) VALUES 
    ('d', oils_i18n_gettext('d', 'Adolescent', 'cam', 'value'),
    oils_i18n_gettext('d', 'The item is intended for young people, approximate ages 14-17 years.', 'cam', 'description'));
INSERT INTO config.audience_map (code, value, description) VALUES 
    ('e', oils_i18n_gettext('e', 'Adult', 'cam', 'value'),
	oils_i18n_gettext('e', 'The item is intended for adults.', 'cam', 'description'));
INSERT INTO config.audience_map (code, value, description) VALUES 
    ('f', oils_i18n_gettext('f', 'Specialized', 'cam', 'value'),
	oils_i18n_gettext('f', 'The item is aimed at a particular audience and the nature of the presentation makes the item of little interest to another audience.', 'cam', 'description'));
INSERT INTO config.audience_map (code, value, description) VALUES 
    ('g', oils_i18n_gettext('g', 'General', 'cam', 'value'),
	oils_i18n_gettext('g', 'The item is of general interest and not aimed at an audience of a particular intellectual level.', 'cam', 'description'));
INSERT INTO config.audience_map (code, value, description) VALUES 
    ('j', oils_i18n_gettext('j', 'Juvenile', 'cam', 'value'),
	oils_i18n_gettext('j', 'The item is intended for children and young people, approximate ages 0-15 years.', 'cam', 'description'));

INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('0', oils_i18n_gettext('0', 'Not fiction (not further specified)', 'clfm', 'value'),
	oils_i18n_gettext('0', 'The item is not a work of fiction and no further identification of the literary form is desired', 'clfm', 'description'));
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('1', oils_i18n_gettext('1', 'Fiction (not further specified)', 'clfm', 'value'),
	oils_i18n_gettext('1', 'The item is a work of fiction and no further identification of the literary form is desired', 'clfm', 'description'));
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('c', oils_i18n_gettext('c', 'Comic strips', 'clfm', 'value'), NULL);
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('d', oils_i18n_gettext('d', 'Dramas', 'clfm', 'value'), NULL);
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('e', oils_i18n_gettext('e', 'Essays', 'clfm', 'value'), NULL);
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('f', oils_i18n_gettext('f', 'Novels', 'clfm', 'value'), NULL);
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('h', oils_i18n_gettext('h', 'Humor, satires, etc.', 'clfm', 'value'),
	oils_i18n_gettext('h', 'The item is a humorous work, satire or of similar literary form.', 'clfm', 'description'));
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('i', oils_i18n_gettext('i', 'Letters', 'clfm', 'value'),
	oils_i18n_gettext('i', 'The item is a single letter or collection of correspondence.', 'clfm', 'description'));
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('j', oils_i18n_gettext('j', 'Short stories', 'clfm', 'value'),
	oils_i18n_gettext('j', 'The item is a short story or collection of short stories.', 'clfm', 'description'));
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('m', oils_i18n_gettext('m', 'Mixed forms', 'clfm', 'value'),
	oils_i18n_gettext('m', 'The item is a variety of literary forms (e.g., poetry and short stories).', 'clfm', 'description'));
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('p', oils_i18n_gettext('p', 'Poetry', 'clfm', 'value'),
	oils_i18n_gettext('p', 'The item is a poem or collection of poems.', 'clfm', 'description'));
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('s', oils_i18n_gettext('s', 'Speeches', 'clfm', 'value'),
	oils_i18n_gettext('s', 'The item is a speech or collection of speeches.', 'clfm', 'description'));
INSERT INTO config.lit_form_map (code, value, description) VALUES 
    ('u', oils_i18n_gettext('u', 'Unknown', 'clfm', 'value'),
	oils_i18n_gettext('u', 'The literary form of the item is unknown.', 'clfm', 'description'));

-- TO-DO: Auto-generate these values from CLDR
-- XXX These are the values used in MARC records ... does that match CLDR, including deprecated languages?
INSERT INTO config.language_map (code, value) VALUES ('aar', oils_i18n_gettext('aar', 'Afar', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('abk', oils_i18n_gettext('abk', 'Abkhaz', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ace', oils_i18n_gettext('ace', 'Achinese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ach', oils_i18n_gettext('ach', 'Acoli', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ada', oils_i18n_gettext('ada', 'Adangme', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ady', oils_i18n_gettext('ady', 'Adygei', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('afa', oils_i18n_gettext('afa', 'Afroasiatic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('afh', oils_i18n_gettext('afh', 'Afrihili (Artificial language)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('afr', oils_i18n_gettext('afr', 'Afrikaans', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-ajm', oils_i18n_gettext('-ajm', 'Aljamía', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('aka', oils_i18n_gettext('aka', 'Akan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('akk', oils_i18n_gettext('akk', 'Akkadian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('alb', oils_i18n_gettext('alb', 'Albanian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ale', oils_i18n_gettext('ale', 'Aleut', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('alg', oils_i18n_gettext('alg', 'Algonquian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('amh', oils_i18n_gettext('amh', 'Amharic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ang', oils_i18n_gettext('ang', 'English, Old (ca. 450-1100)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('apa', oils_i18n_gettext('apa', 'Apache languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ara', oils_i18n_gettext('ara', 'Arabic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('arc', oils_i18n_gettext('arc', 'Aramaic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('arg', oils_i18n_gettext('arg', 'Aragonese Spanish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('arm', oils_i18n_gettext('arm', 'Armenian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('arn', oils_i18n_gettext('arn', 'Mapuche', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('arp', oils_i18n_gettext('arp', 'Arapaho', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('art', oils_i18n_gettext('art', 'Artificial (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('arw', oils_i18n_gettext('arw', 'Arawak', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('asm', oils_i18n_gettext('asm', 'Assamese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ast', oils_i18n_gettext('ast', 'Bable', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ath', oils_i18n_gettext('ath', 'Athapascan (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('aus', oils_i18n_gettext('aus', 'Australian languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ava', oils_i18n_gettext('ava', 'Avaric', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ave', oils_i18n_gettext('ave', 'Avestan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('awa', oils_i18n_gettext('awa', 'Awadhi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('aym', oils_i18n_gettext('aym', 'Aymara', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('aze', oils_i18n_gettext('aze', 'Azerbaijani', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bad', oils_i18n_gettext('bad', 'Banda', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bai', oils_i18n_gettext('bai', 'Bamileke languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bak', oils_i18n_gettext('bak', 'Bashkir', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bal', oils_i18n_gettext('bal', 'Baluchi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bam', oils_i18n_gettext('bam', 'Bambara', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ban', oils_i18n_gettext('ban', 'Balinese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('baq', oils_i18n_gettext('baq', 'Basque', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bas', oils_i18n_gettext('bas', 'Basa', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bat', oils_i18n_gettext('bat', 'Baltic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bej', oils_i18n_gettext('bej', 'Beja', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bel', oils_i18n_gettext('bel', 'Belarusian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bem', oils_i18n_gettext('bem', 'Bemba', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ben', oils_i18n_gettext('ben', 'Bengali', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ber', oils_i18n_gettext('ber', 'Berber (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bho', oils_i18n_gettext('bho', 'Bhojpuri', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bih', oils_i18n_gettext('bih', 'Bihari', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bik', oils_i18n_gettext('bik', 'Bikol', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bin', oils_i18n_gettext('bin', 'Edo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bis', oils_i18n_gettext('bis', 'Bislama', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bla', oils_i18n_gettext('bla', 'Siksika', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bnt', oils_i18n_gettext('bnt', 'Bantu (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bos', oils_i18n_gettext('bos', 'Bosnian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bra', oils_i18n_gettext('bra', 'Braj', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bre', oils_i18n_gettext('bre', 'Breton', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('btk', oils_i18n_gettext('btk', 'Batak', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bua', oils_i18n_gettext('bua', 'Buriat', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bug', oils_i18n_gettext('bug', 'Bugis', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bul', oils_i18n_gettext('bul', 'Bulgarian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('bur', oils_i18n_gettext('bur', 'Burmese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cad', oils_i18n_gettext('cad', 'Caddo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cai', oils_i18n_gettext('cai', 'Central American Indian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-cam', oils_i18n_gettext('-cam', 'Khmer', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('car', oils_i18n_gettext('car', 'Carib', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cat', oils_i18n_gettext('cat', 'Catalan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cau', oils_i18n_gettext('cau', 'Caucasian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ceb', oils_i18n_gettext('ceb', 'Cebuano', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cel', oils_i18n_gettext('cel', 'Celtic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cha', oils_i18n_gettext('cha', 'Chamorro', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chb', oils_i18n_gettext('chb', 'Chibcha', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('che', oils_i18n_gettext('che', 'Chechen', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chg', oils_i18n_gettext('chg', 'Chagatai', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chi', oils_i18n_gettext('chi', 'Chinese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chk', oils_i18n_gettext('chk', 'Truk', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chm', oils_i18n_gettext('chm', 'Mari', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chn', oils_i18n_gettext('chn', 'Chinook jargon', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cho', oils_i18n_gettext('cho', 'Choctaw', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chp', oils_i18n_gettext('chp', 'Chipewyan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chr', oils_i18n_gettext('chr', 'Cherokee', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chu', oils_i18n_gettext('chu', 'Church Slavic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chv', oils_i18n_gettext('chv', 'Chuvash', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('chy', oils_i18n_gettext('chy', 'Cheyenne', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cmc', oils_i18n_gettext('cmc', 'Chamic languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cop', oils_i18n_gettext('cop', 'Coptic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cor', oils_i18n_gettext('cor', 'Cornish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cos', oils_i18n_gettext('cos', 'Corsican', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cpe', oils_i18n_gettext('cpe', 'Creoles and Pidgins, English-based (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cpf', oils_i18n_gettext('cpf', 'Creoles and Pidgins, French-based (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cpp', oils_i18n_gettext('cpp', 'Creoles and Pidgins, Portuguese-based (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cre', oils_i18n_gettext('cre', 'Cree', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('crh', oils_i18n_gettext('crh', 'Crimean Tatar', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('crp', oils_i18n_gettext('crp', 'Creoles and Pidgins (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cus', oils_i18n_gettext('cus', 'Cushitic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('cze', oils_i18n_gettext('cze', 'Czech', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dak', oils_i18n_gettext('dak', 'Dakota', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dan', oils_i18n_gettext('dan', 'Danish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dar', oils_i18n_gettext('dar', 'Dargwa', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('day', oils_i18n_gettext('day', 'Dayak', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('del', oils_i18n_gettext('del', 'Delaware', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('den', oils_i18n_gettext('den', 'Slave', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dgr', oils_i18n_gettext('dgr', 'Dogrib', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('din', oils_i18n_gettext('din', 'Dinka', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('div', oils_i18n_gettext('div', 'Divehi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('doi', oils_i18n_gettext('doi', 'Dogri', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dra', oils_i18n_gettext('dra', 'Dravidian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dua', oils_i18n_gettext('dua', 'Duala', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dum', oils_i18n_gettext('dum', 'Dutch, Middle (ca. 1050-1350)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dut', oils_i18n_gettext('dut', 'Dutch', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dyu', oils_i18n_gettext('dyu', 'Dyula', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('dzo', oils_i18n_gettext('dzo', 'Dzongkha', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('efi', oils_i18n_gettext('efi', 'Efik', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('egy', oils_i18n_gettext('egy', 'Egyptian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('eka', oils_i18n_gettext('eka', 'Ekajuk', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('elx', oils_i18n_gettext('elx', 'Elamite', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('eng', oils_i18n_gettext('eng', 'English', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('enm', oils_i18n_gettext('enm', 'English, Middle (1100-1500)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('epo', oils_i18n_gettext('epo', 'Esperanto', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-esk', oils_i18n_gettext('-esk', 'Eskimo languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-esp', oils_i18n_gettext('-esp', 'Esperanto', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('est', oils_i18n_gettext('est', 'Estonian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-eth', oils_i18n_gettext('-eth', 'Ethiopic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ewe', oils_i18n_gettext('ewe', 'Ewe', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ewo', oils_i18n_gettext('ewo', 'Ewondo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fan', oils_i18n_gettext('fan', 'Fang', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fao', oils_i18n_gettext('fao', 'Faroese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-far', oils_i18n_gettext('-far', 'Faroese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fat', oils_i18n_gettext('fat', 'Fanti', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fij', oils_i18n_gettext('fij', 'Fijian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fin', oils_i18n_gettext('fin', 'Finnish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fiu', oils_i18n_gettext('fiu', 'Finno-Ugrian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fon', oils_i18n_gettext('fon', 'Fon', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fre', oils_i18n_gettext('fre', 'French', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-fri', oils_i18n_gettext('-fri', 'Frisian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('frm', oils_i18n_gettext('frm', 'French, Middle (ca. 1400-1600)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fro', oils_i18n_gettext('fro', 'French, Old (ca. 842-1400)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fry', oils_i18n_gettext('fry', 'Frisian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ful', oils_i18n_gettext('ful', 'Fula', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('fur', oils_i18n_gettext('fur', 'Friulian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gaa', oils_i18n_gettext('gaa', 'Gã', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-gae', oils_i18n_gettext('-gae', 'Scottish Gaelic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-gag', oils_i18n_gettext('-gag', 'Galician', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-gal', oils_i18n_gettext('-gal', 'Oromo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gay', oils_i18n_gettext('gay', 'Gayo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gba', oils_i18n_gettext('gba', 'Gbaya', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gem', oils_i18n_gettext('gem', 'Germanic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('geo', oils_i18n_gettext('geo', 'Georgian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ger', oils_i18n_gettext('ger', 'German', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gez', oils_i18n_gettext('gez', 'Ethiopic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gil', oils_i18n_gettext('gil', 'Gilbertese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gla', oils_i18n_gettext('gla', 'Scottish Gaelic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gle', oils_i18n_gettext('gle', 'Irish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('glg', oils_i18n_gettext('glg', 'Galician', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('glv', oils_i18n_gettext('glv', 'Manx', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gmh', oils_i18n_gettext('gmh', 'German, Middle High (ca. 1050-1500)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('goh', oils_i18n_gettext('goh', 'German, Old High (ca. 750-1050)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gon', oils_i18n_gettext('gon', 'Gondi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gor', oils_i18n_gettext('gor', 'Gorontalo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('got', oils_i18n_gettext('got', 'Gothic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('grb', oils_i18n_gettext('grb', 'Grebo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('grc', oils_i18n_gettext('grc', 'Greek, Ancient (to 1453)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gre', oils_i18n_gettext('gre', 'Greek, Modern (1453- )', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('grn', oils_i18n_gettext('grn', 'Guarani', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-gua', oils_i18n_gettext('-gua', 'Guarani', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('guj', oils_i18n_gettext('guj', 'Gujarati', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('gwi', oils_i18n_gettext('gwi', 'Gwich', 'clm', 'value''in'));
INSERT INTO config.language_map (code, value) VALUES ('hai', oils_i18n_gettext('hai', 'Haida', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hat', oils_i18n_gettext('hat', 'Haitian French Creole', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hau', oils_i18n_gettext('hau', 'Hausa', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('haw', oils_i18n_gettext('haw', 'Hawaiian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('heb', oils_i18n_gettext('heb', 'Hebrew', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('her', oils_i18n_gettext('her', 'Herero', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hil', oils_i18n_gettext('hil', 'Hiligaynon', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('him', oils_i18n_gettext('him', 'Himachali', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hin', oils_i18n_gettext('hin', 'Hindi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hit', oils_i18n_gettext('hit', 'Hittite', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hmn', oils_i18n_gettext('hmn', 'Hmong', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hmo', oils_i18n_gettext('hmo', 'Hiri Motu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hun', oils_i18n_gettext('hun', 'Hungarian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('hup', oils_i18n_gettext('hup', 'Hupa', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('iba', oils_i18n_gettext('iba', 'Iban', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ibo', oils_i18n_gettext('ibo', 'Igbo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ice', oils_i18n_gettext('ice', 'Icelandic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ido', oils_i18n_gettext('ido', 'Ido', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('iii', oils_i18n_gettext('iii', 'Sichuan Yi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ijo', oils_i18n_gettext('ijo', 'Ijo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('iku', oils_i18n_gettext('iku', 'Inuktitut', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ile', oils_i18n_gettext('ile', 'Interlingue', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ilo', oils_i18n_gettext('ilo', 'Iloko', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ina', oils_i18n_gettext('ina', 'Interlingua (International Auxiliary Language Association)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('inc', oils_i18n_gettext('inc', 'Indic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ind', oils_i18n_gettext('ind', 'Indonesian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ine', oils_i18n_gettext('ine', 'Indo-European (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('inh', oils_i18n_gettext('inh', 'Ingush', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-int', oils_i18n_gettext('-int', 'Interlingua (International Auxiliary Language Association)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ipk', oils_i18n_gettext('ipk', 'Inupiaq', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ira', oils_i18n_gettext('ira', 'Iranian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-iri', oils_i18n_gettext('-iri', 'Irish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('iro', oils_i18n_gettext('iro', 'Iroquoian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ita', oils_i18n_gettext('ita', 'Italian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('jav', oils_i18n_gettext('jav', 'Javanese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('jpn', oils_i18n_gettext('jpn', 'Japanese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('jpr', oils_i18n_gettext('jpr', 'Judeo-Persian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('jrb', oils_i18n_gettext('jrb', 'Judeo-Arabic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kaa', oils_i18n_gettext('kaa', 'Kara-Kalpak', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kab', oils_i18n_gettext('kab', 'Kabyle', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kac', oils_i18n_gettext('kac', 'Kachin', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kal', oils_i18n_gettext('kal', 'Kalâtdlisut', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kam', oils_i18n_gettext('kam', 'Kamba', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kan', oils_i18n_gettext('kan', 'Kannada', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kar', oils_i18n_gettext('kar', 'Karen', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kas', oils_i18n_gettext('kas', 'Kashmiri', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kau', oils_i18n_gettext('kau', 'Kanuri', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kaw', oils_i18n_gettext('kaw', 'Kawi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kaz', oils_i18n_gettext('kaz', 'Kazakh', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kbd', oils_i18n_gettext('kbd', 'Kabardian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kha', oils_i18n_gettext('kha', 'Khasi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('khi', oils_i18n_gettext('khi', 'Khoisan (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('khm', oils_i18n_gettext('khm', 'Khmer', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kho', oils_i18n_gettext('kho', 'Khotanese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kik', oils_i18n_gettext('kik', 'Kikuyu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kin', oils_i18n_gettext('kin', 'Kinyarwanda', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kir', oils_i18n_gettext('kir', 'Kyrgyz', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kmb', oils_i18n_gettext('kmb', 'Kimbundu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kok', oils_i18n_gettext('kok', 'Konkani', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kom', oils_i18n_gettext('kom', 'Komi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kon', oils_i18n_gettext('kon', 'Kongo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kor', oils_i18n_gettext('kor', 'Korean', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kos', oils_i18n_gettext('kos', 'Kusaie', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kpe', oils_i18n_gettext('kpe', 'Kpelle', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kro', oils_i18n_gettext('kro', 'Kru', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kru', oils_i18n_gettext('kru', 'Kurukh', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kua', oils_i18n_gettext('kua', 'Kuanyama', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kum', oils_i18n_gettext('kum', 'Kumyk', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kur', oils_i18n_gettext('kur', 'Kurdish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-kus', oils_i18n_gettext('-kus', 'Kusaie', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('kut', oils_i18n_gettext('kut', 'Kutenai', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lad', oils_i18n_gettext('lad', 'Ladino', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lah', oils_i18n_gettext('lah', 'Lahnda', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lam', oils_i18n_gettext('lam', 'Lamba', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-lan', oils_i18n_gettext('-lan', 'Occitan (post-1500)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lao', oils_i18n_gettext('lao', 'Lao', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-lap', oils_i18n_gettext('-lap', 'Sami', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lat', oils_i18n_gettext('lat', 'Latin', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lav', oils_i18n_gettext('lav', 'Latvian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lez', oils_i18n_gettext('lez', 'Lezgian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lim', oils_i18n_gettext('lim', 'Limburgish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lin', oils_i18n_gettext('lin', 'Lingala', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lit', oils_i18n_gettext('lit', 'Lithuanian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lol', oils_i18n_gettext('lol', 'Mongo-Nkundu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('loz', oils_i18n_gettext('loz', 'Lozi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ltz', oils_i18n_gettext('ltz', 'Letzeburgesch', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lua', oils_i18n_gettext('lua', 'Luba-Lulua', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lub', oils_i18n_gettext('lub', 'Luba-Katanga', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lug', oils_i18n_gettext('lug', 'Ganda', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lui', oils_i18n_gettext('lui', 'Luiseño', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lun', oils_i18n_gettext('lun', 'Lunda', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('luo', oils_i18n_gettext('luo', 'Luo (Kenya and Tanzania)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('lus', oils_i18n_gettext('lus', 'Lushai', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mac', oils_i18n_gettext('mac', 'Macedonian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mad', oils_i18n_gettext('mad', 'Madurese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mag', oils_i18n_gettext('mag', 'Magahi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mah', oils_i18n_gettext('mah', 'Marshallese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mai', oils_i18n_gettext('mai', 'Maithili', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mak', oils_i18n_gettext('mak', 'Makasar', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mal', oils_i18n_gettext('mal', 'Malayalam', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('man', oils_i18n_gettext('man', 'Mandingo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mao', oils_i18n_gettext('mao', 'Maori', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('map', oils_i18n_gettext('map', 'Austronesian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mar', oils_i18n_gettext('mar', 'Marathi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mas', oils_i18n_gettext('mas', 'Masai', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-max', oils_i18n_gettext('-max', 'Manx', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('may', oils_i18n_gettext('may', 'Malay', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mdr', oils_i18n_gettext('mdr', 'Mandar', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('men', oils_i18n_gettext('men', 'Mende', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mga', oils_i18n_gettext('mga', 'Irish, Middle (ca. 1100-1550)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mic', oils_i18n_gettext('mic', 'Micmac', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('min', oils_i18n_gettext('min', 'Minangkabau', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mis', oils_i18n_gettext('mis', 'Miscellaneous languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mkh', oils_i18n_gettext('mkh', 'Mon-Khmer (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-mla', oils_i18n_gettext('-mla', 'Malagasy', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mlg', oils_i18n_gettext('mlg', 'Malagasy', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mlt', oils_i18n_gettext('mlt', 'Maltese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mnc', oils_i18n_gettext('mnc', 'Manchu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mni', oils_i18n_gettext('mni', 'Manipuri', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mno', oils_i18n_gettext('mno', 'Manobo languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('moh', oils_i18n_gettext('moh', 'Mohawk', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mol', oils_i18n_gettext('mol', 'Moldavian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mon', oils_i18n_gettext('mon', 'Mongolian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mos', oils_i18n_gettext('mos', 'Mooré', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mul', oils_i18n_gettext('mul', 'Multiple languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mun', oils_i18n_gettext('mun', 'Munda (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mus', oils_i18n_gettext('mus', 'Creek', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('mwr', oils_i18n_gettext('mwr', 'Marwari', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('myn', oils_i18n_gettext('myn', 'Mayan languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nah', oils_i18n_gettext('nah', 'Nahuatl', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nai', oils_i18n_gettext('nai', 'North American Indian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nap', oils_i18n_gettext('nap', 'Neapolitan Italian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nau', oils_i18n_gettext('nau', 'Nauru', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nav', oils_i18n_gettext('nav', 'Navajo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nbl', oils_i18n_gettext('nbl', 'Ndebele (South Africa)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nde', oils_i18n_gettext('nde', 'Ndebele (Zimbabwe)  ', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ndo', oils_i18n_gettext('ndo', 'Ndonga', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nds', oils_i18n_gettext('nds', 'Low German', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nep', oils_i18n_gettext('nep', 'Nepali', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('new', oils_i18n_gettext('new', 'Newari', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nia', oils_i18n_gettext('nia', 'Nias', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nic', oils_i18n_gettext('nic', 'Niger-Kordofanian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('niu', oils_i18n_gettext('niu', 'Niuean', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nno', oils_i18n_gettext('nno', 'Norwegian (Nynorsk)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nob', oils_i18n_gettext('nob', 'Norwegian (Bokmål)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nog', oils_i18n_gettext('nog', 'Nogai', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('non', oils_i18n_gettext('non', 'Old Norse', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nor', oils_i18n_gettext('nor', 'Norwegian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nso', oils_i18n_gettext('nso', 'Northern Sotho', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nub', oils_i18n_gettext('nub', 'Nubian languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nya', oils_i18n_gettext('nya', 'Nyanja', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nym', oils_i18n_gettext('nym', 'Nyamwezi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nyn', oils_i18n_gettext('nyn', 'Nyankole', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nyo', oils_i18n_gettext('nyo', 'Nyoro', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('nzi', oils_i18n_gettext('nzi', 'Nzima', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('oci', oils_i18n_gettext('oci', 'Occitan (post-1500)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('oji', oils_i18n_gettext('oji', 'Ojibwa', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ori', oils_i18n_gettext('ori', 'Oriya', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('orm', oils_i18n_gettext('orm', 'Oromo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('osa', oils_i18n_gettext('osa', 'Osage', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('oss', oils_i18n_gettext('oss', 'Ossetic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ota', oils_i18n_gettext('ota', 'Turkish, Ottoman', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('oto', oils_i18n_gettext('oto', 'Otomian languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('paa', oils_i18n_gettext('paa', 'Papuan (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pag', oils_i18n_gettext('pag', 'Pangasinan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pal', oils_i18n_gettext('pal', 'Pahlavi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pam', oils_i18n_gettext('pam', 'Pampanga', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pan', oils_i18n_gettext('pan', 'Panjabi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pap', oils_i18n_gettext('pap', 'Papiamento', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pau', oils_i18n_gettext('pau', 'Palauan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('peo', oils_i18n_gettext('peo', 'Old Persian (ca. 600-400 B.C.)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('per', oils_i18n_gettext('per', 'Persian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('phi', oils_i18n_gettext('phi', 'Philippine (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('phn', oils_i18n_gettext('phn', 'Phoenician', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pli', oils_i18n_gettext('pli', 'Pali', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pol', oils_i18n_gettext('pol', 'Polish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pon', oils_i18n_gettext('pon', 'Ponape', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('por', oils_i18n_gettext('por', 'Portuguese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pra', oils_i18n_gettext('pra', 'Prakrit languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pro', oils_i18n_gettext('pro', 'Provençal (to 1500)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('pus', oils_i18n_gettext('pus', 'Pushto', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('que', oils_i18n_gettext('que', 'Quechua', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('raj', oils_i18n_gettext('raj', 'Rajasthani', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('rap', oils_i18n_gettext('rap', 'Rapanui', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('rar', oils_i18n_gettext('rar', 'Rarotongan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('roa', oils_i18n_gettext('roa', 'Romance (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('roh', oils_i18n_gettext('roh', 'Raeto-Romance', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('rom', oils_i18n_gettext('rom', 'Romani', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('rum', oils_i18n_gettext('rum', 'Romanian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('run', oils_i18n_gettext('run', 'Rundi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('rus', oils_i18n_gettext('rus', 'Russian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sad', oils_i18n_gettext('sad', 'Sandawe', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sag', oils_i18n_gettext('sag', 'Sango (Ubangi Creole)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sah', oils_i18n_gettext('sah', 'Yakut', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sai', oils_i18n_gettext('sai', 'South American Indian (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sal', oils_i18n_gettext('sal', 'Salishan languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sam', oils_i18n_gettext('sam', 'Samaritan Aramaic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('san', oils_i18n_gettext('san', 'Sanskrit', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-sao', oils_i18n_gettext('-sao', 'Samoan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sas', oils_i18n_gettext('sas', 'Sasak', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sat', oils_i18n_gettext('sat', 'Santali', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('scc', oils_i18n_gettext('scc', 'Serbian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sco', oils_i18n_gettext('sco', 'Scots', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('scr', oils_i18n_gettext('scr', 'Croatian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sel', oils_i18n_gettext('sel', 'Selkup', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sem', oils_i18n_gettext('sem', 'Semitic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sga', oils_i18n_gettext('sga', 'Irish, Old (to 1100)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sgn', oils_i18n_gettext('sgn', 'Sign languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('shn', oils_i18n_gettext('shn', 'Shan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-sho', oils_i18n_gettext('-sho', 'Shona', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sid', oils_i18n_gettext('sid', 'Sidamo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sin', oils_i18n_gettext('sin', 'Sinhalese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sio', oils_i18n_gettext('sio', 'Siouan (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sit', oils_i18n_gettext('sit', 'Sino-Tibetan (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sla', oils_i18n_gettext('sla', 'Slavic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('slo', oils_i18n_gettext('slo', 'Slovak', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('slv', oils_i18n_gettext('slv', 'Slovenian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sma', oils_i18n_gettext('sma', 'Southern Sami', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sme', oils_i18n_gettext('sme', 'Northern Sami', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('smi', oils_i18n_gettext('smi', 'Sami', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('smj', oils_i18n_gettext('smj', 'Lule Sami', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('smn', oils_i18n_gettext('smn', 'Inari Sami', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('smo', oils_i18n_gettext('smo', 'Samoan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sms', oils_i18n_gettext('sms', 'Skolt Sami', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sna', oils_i18n_gettext('sna', 'Shona', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('snd', oils_i18n_gettext('snd', 'Sindhi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-snh', oils_i18n_gettext('-snh', 'Sinhalese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('snk', oils_i18n_gettext('snk', 'Soninke', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sog', oils_i18n_gettext('sog', 'Sogdian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('som', oils_i18n_gettext('som', 'Somali', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('son', oils_i18n_gettext('son', 'Songhai', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sot', oils_i18n_gettext('sot', 'Sotho', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('spa', oils_i18n_gettext('spa', 'Spanish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('srd', oils_i18n_gettext('srd', 'Sardinian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('srr', oils_i18n_gettext('srr', 'Serer', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ssa', oils_i18n_gettext('ssa', 'Nilo-Saharan (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-sso', oils_i18n_gettext('-sso', 'Sotho', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ssw', oils_i18n_gettext('ssw', 'Swazi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('suk', oils_i18n_gettext('suk', 'Sukuma', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sun', oils_i18n_gettext('sun', 'Sundanese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sus', oils_i18n_gettext('sus', 'Susu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('sux', oils_i18n_gettext('sux', 'Sumerian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('swa', oils_i18n_gettext('swa', 'Swahili', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('swe', oils_i18n_gettext('swe', 'Swedish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-swz', oils_i18n_gettext('-swz', 'Swazi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('syr', oils_i18n_gettext('syr', 'Syriac', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-tag', oils_i18n_gettext('-tag', 'Tagalog', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tah', oils_i18n_gettext('tah', 'Tahitian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tai', oils_i18n_gettext('tai', 'Tai (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-taj', oils_i18n_gettext('-taj', 'Tajik', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tam', oils_i18n_gettext('tam', 'Tamil', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-tar', oils_i18n_gettext('-tar', 'Tatar', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tat', oils_i18n_gettext('tat', 'Tatar', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tel', oils_i18n_gettext('tel', 'Telugu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tem', oils_i18n_gettext('tem', 'Temne', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ter', oils_i18n_gettext('ter', 'Terena', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tet', oils_i18n_gettext('tet', 'Tetum', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tgk', oils_i18n_gettext('tgk', 'Tajik', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tgl', oils_i18n_gettext('tgl', 'Tagalog', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tha', oils_i18n_gettext('tha', 'Thai', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tib', oils_i18n_gettext('tib', 'Tibetan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tig', oils_i18n_gettext('tig', 'Tigré', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tir', oils_i18n_gettext('tir', 'Tigrinya', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tiv', oils_i18n_gettext('tiv', 'Tiv', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tkl', oils_i18n_gettext('tkl', 'Tokelauan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tli', oils_i18n_gettext('tli', 'Tlingit', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tmh', oils_i18n_gettext('tmh', 'Tamashek', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tog', oils_i18n_gettext('tog', 'Tonga (Nyasa)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ton', oils_i18n_gettext('ton', 'Tongan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tpi', oils_i18n_gettext('tpi', 'Tok Pisin', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-tru', oils_i18n_gettext('-tru', 'Truk', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tsi', oils_i18n_gettext('tsi', 'Tsimshian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tsn', oils_i18n_gettext('tsn', 'Tswana', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tso', oils_i18n_gettext('tso', 'Tsonga', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('-tsw', oils_i18n_gettext('-tsw', 'Tswana', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tuk', oils_i18n_gettext('tuk', 'Turkmen', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tum', oils_i18n_gettext('tum', 'Tumbuka', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tup', oils_i18n_gettext('tup', 'Tupi languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tur', oils_i18n_gettext('tur', 'Turkish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tut', oils_i18n_gettext('tut', 'Altaic (Other)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tvl', oils_i18n_gettext('tvl', 'Tuvaluan', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('twi', oils_i18n_gettext('twi', 'Twi', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('tyv', oils_i18n_gettext('tyv', 'Tuvinian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('udm', oils_i18n_gettext('udm', 'Udmurt', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('uga', oils_i18n_gettext('uga', 'Ugaritic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('uig', oils_i18n_gettext('uig', 'Uighur', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ukr', oils_i18n_gettext('ukr', 'Ukrainian', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('umb', oils_i18n_gettext('umb', 'Umbundu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('und', oils_i18n_gettext('und', 'Undetermined', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('urd', oils_i18n_gettext('urd', 'Urdu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('uzb', oils_i18n_gettext('uzb', 'Uzbek', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('vai', oils_i18n_gettext('vai', 'Vai', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ven', oils_i18n_gettext('ven', 'Venda', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('vie', oils_i18n_gettext('vie', 'Vietnamese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('vol', oils_i18n_gettext('vol', 'Volapük', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('vot', oils_i18n_gettext('vot', 'Votic', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('wak', oils_i18n_gettext('wak', 'Wakashan languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('wal', oils_i18n_gettext('wal', 'Walamo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('war', oils_i18n_gettext('war', 'Waray', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('was', oils_i18n_gettext('was', 'Washo', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('wel', oils_i18n_gettext('wel', 'Welsh', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('wen', oils_i18n_gettext('wen', 'Sorbian languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('wln', oils_i18n_gettext('wln', 'Walloon', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('wol', oils_i18n_gettext('wol', 'Wolof', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('xal', oils_i18n_gettext('xal', 'Kalmyk', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('xho', oils_i18n_gettext('xho', 'Xhosa', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('yao', oils_i18n_gettext('yao', 'Yao (Africa)', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('yap', oils_i18n_gettext('yap', 'Yapese', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('yid', oils_i18n_gettext('yid', 'Yiddish', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('yor', oils_i18n_gettext('yor', 'Yoruba', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('ypk', oils_i18n_gettext('ypk', 'Yupik languages', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('zap', oils_i18n_gettext('zap', 'Zapotec', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('zen', oils_i18n_gettext('zen', 'Zenaga', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('zha', oils_i18n_gettext('zha', 'Zhuang', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('znd', oils_i18n_gettext('znd', 'Zande', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('zul', oils_i18n_gettext('zul', 'Zulu', 'clm', 'value'));
INSERT INTO config.language_map (code, value) VALUES ('zun', oils_i18n_gettext('zun', 'Zuni', 'clm', 'value'));

INSERT INTO config.item_form_map (code, value) VALUES ('a', oils_i18n_gettext('a', 'Microfilm', 'cifm', 'value'));
INSERT INTO config.item_form_map (code, value) VALUES ('b', oils_i18n_gettext('b', 'Microfiche', 'cifm', 'value'));
INSERT INTO config.item_form_map (code, value) VALUES ('c', oils_i18n_gettext('c', 'Microopaque', 'cifm', 'value'));
INSERT INTO config.item_form_map (code, value) VALUES ('d', oils_i18n_gettext('d', 'Large print', 'cifm', 'value'));
INSERT INTO config.item_form_map (code, value) VALUES ('f', oils_i18n_gettext('f', 'Braille', 'cifm', 'value'));
INSERT INTO config.item_form_map (code, value) VALUES ('r', oils_i18n_gettext('r', 'Regular print reproduction', 'cifm', 'value'));
INSERT INTO config.item_form_map (code, value) VALUES ('s', oils_i18n_gettext('s', 'Electronic', 'cifm', 'value'));

INSERT INTO config.item_type_map (code, value) VALUES ('a', oils_i18n_gettext('a', 'Language material', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('t', oils_i18n_gettext('t', 'Manuscript language material', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('g', oils_i18n_gettext('g', 'Projected medium', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('k', oils_i18n_gettext('k', 'Two-dimensional nonprojectable graphic', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('r', oils_i18n_gettext('r', 'Three-dimensional artifact or naturally occurring object', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('o', oils_i18n_gettext('o', 'Kit', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('p', oils_i18n_gettext('p', 'Mixed materials', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('e', oils_i18n_gettext('e', 'Cartographic material', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('f', oils_i18n_gettext('f', 'Manuscript cartographic material', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('c', oils_i18n_gettext('c', 'Notated music', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('d', oils_i18n_gettext('d', 'Manuscript notated music', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('i', oils_i18n_gettext('i', 'Nonmusical sound recording', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('j', oils_i18n_gettext('j', 'Musical sound recording', 'citm', 'value'));
INSERT INTO config.item_type_map (code, value) VALUES ('m', oils_i18n_gettext('m', 'Computer file', 'citm', 'value'));

INSERT INTO config.bib_level_map (code, value) VALUES ('a', oils_i18n_gettext('a', 'Monographic component part', 'cblvl', 'value'));
INSERT INTO config.bib_level_map (code, value) VALUES ('b', oils_i18n_gettext('b', 'Serial component part', 'cblvl', 'value'));
INSERT INTO config.bib_level_map (code, value) VALUES ('c', oils_i18n_gettext('c', 'Collection', 'cblvl', 'value'));
INSERT INTO config.bib_level_map (code, value) VALUES ('d', oils_i18n_gettext('d', 'Subunit', 'cblvl', 'value'));
INSERT INTO config.bib_level_map (code, value) VALUES ('i', oils_i18n_gettext('i', 'Integrating resource', 'cblvl', 'value'));
INSERT INTO config.bib_level_map (code, value) VALUES ('m', oils_i18n_gettext('m', 'Monograph/Item', 'cblvl', 'value'));
INSERT INTO config.bib_level_map (code, value) VALUES ('s', oils_i18n_gettext('s', 'Serial', 'cblvl', 'value'));

-- available locales
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('en-US', 'eng', oils_i18n_gettext('en-US', 'English (US)', 'i18n_l', 'name'),
	oils_i18n_gettext('en-US', 'American English', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('cs-CZ', 'cze', oils_i18n_gettext('cs-CZ', 'Czech', 'i18n_l', 'name'),
	oils_i18n_gettext('cs-CZ', 'Czech', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('en-CA', 'eng', oils_i18n_gettext('en-CA', 'English (Canada)', 'i18n_l', 'name'),
	oils_i18n_gettext('en-CA', 'Canadian English', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('fr-CA', 'fre', oils_i18n_gettext('fr-CA', 'French (Canada)', 'i18n_l', 'name'),
	oils_i18n_gettext('fr-CA', 'Canadian French', 'i18n_l', 'description'));
-- INSERT INTO config.i18n_locale (code,marc_code,name,description)
--     VALUES ('es-US', 'spa', oils_i18n_gettext('es-US', 'Spanish (US)', 'i18n_l', 'name'),
-- 	oils_i18n_gettext('es-US', 'American Spanish', 'i18n_l', 'description'));
-- INSERT INTO config.i18n_locale (code,marc_code,name,description)
--     VALUES ('es-MX', 'spa', oils_i18n_gettext('es-MX', 'Spanish (Mexico)', 'i18n_l', 'name'),
-- 	oils_i18n_gettext('es-MX', 'Mexican Spanish', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('hy-AM', 'arm', oils_i18n_gettext('hy-AM', 'Armenian', 'i18n_l', 'name'),
	oils_i18n_gettext('hy-AM', 'Armenian', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('ru-RU', 'rus', oils_i18n_gettext('ru-RU', 'Russian', 'i18n_l', 'name'),
	oils_i18n_gettext('ru-RU', 'Russian', 'i18n_l', 'description'));

-- Z39.50 server attributes

INSERT INTO config.z3950_source (name, label, host, port, db, auth)
	VALUES ('loc', oils_i18n_gettext('loc', 'Library of Congress', 'czs', 'label'), 'z3950.loc.gov', 7090, 'Voyager', FALSE);
INSERT INTO config.z3950_source (name, label, host, port, db, auth)
	VALUES ('oclc', oils_i18n_gettext('oclc', 'OCLC', 'czs', 'label'), 'zcat.oclc.org', 210, 'OLUCWorldCat', TRUE);
INSERT INTO config.z3950_source (name, label, host, port, db, auth)
	VALUES ('biblios', oils_i18n_gettext('biblios','‡biblios.net', 'czs', 'label'), 'z3950.biblios.net', 210, 'bibliographic', FALSE);

INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (1, 'loc','tcn', oils_i18n_gettext(1, 'Title Control Number', 'cza', 'label'), 12, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (2, 'loc', 'isbn', oils_i18n_gettext(2, 'ISBN', 'cza', 'label'), 7, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (3, 'loc', 'lccn', oils_i18n_gettext(3, 'LCCN', 'cza', 'label'), 9, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (4, 'loc', 'author', oils_i18n_gettext(4, 'Author', 'cza', 'label'), 1003, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (5, 'loc', 'title', oils_i18n_gettext(5, 'Title', 'cza', 'label'), 4, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (6, 'loc', 'issn', oils_i18n_gettext(6, 'ISSN', 'cza', 'label'), 8, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (7, 'loc', 'publisher', oils_i18n_gettext(7, 'Publisher', 'cza', 'label'), 1018, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (8, 'loc', 'pubdate', oils_i18n_gettext(8, 'Publication Date', 'cza', 'label'), 31, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (9, 'loc', 'item_type', oils_i18n_gettext(9, 'Item Type', 'cza', 'label'), 1001, 1);

UPDATE config.z3950_attr SET truncation = 1 WHERE source = 'loc';

INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (10, 'oclc', 'tcn', oils_i18n_gettext(10, 'Title Control Number', 'cza', 'label'), 12, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (11, 'oclc', 'isbn', oils_i18n_gettext(11, 'ISBN', 'cza', 'label'), 7, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (12, 'oclc', 'lccn', oils_i18n_gettext(12, 'LCCN', 'cza', 'label'), 9, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (13, 'oclc', 'author', oils_i18n_gettext(13, 'Author', 'cza', 'label'), 1003, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (14, 'oclc', 'title', oils_i18n_gettext(14, 'Title', 'cza', 'label'), 4, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (15, 'oclc', 'issn', oils_i18n_gettext(15, 'ISSN', 'cza', 'label'), 8, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (16, 'oclc', 'publisher', oils_i18n_gettext(16, 'Publisher', 'cza', 'label'), 1018, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (17, 'oclc', 'pubdate', oils_i18n_gettext(17, 'Publication Date', 'cza', 'label'), 31, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (18, 'oclc', 'item_type', oils_i18n_gettext(18, 'Item Type', 'cza', 'label'), 1001, 1);

INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (19, 'biblios','tcn', oils_i18n_gettext(19, 'Title Control Number', 'cza', 'label'), 12, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (20, 'biblios', 'isbn', oils_i18n_gettext(20, 'ISBN', 'cza', 'label'), 7, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (21, 'biblios', 'lccn', oils_i18n_gettext(21, 'LCCN', 'cza', 'label'), 9, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (22, 'biblios', 'author', oils_i18n_gettext(22, 'Author', 'cza', 'label'), 1003, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format, truncation)
	VALUES (23, 'biblios', 'title', oils_i18n_gettext(23, 'Title', 'cza', 'label'), 4, 6, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (24, 'biblios', 'issn', oils_i18n_gettext(24, 'ISSN', 'cza', 'label'), 8, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (25, 'biblios', 'publisher', oils_i18n_gettext(25, 'Publisher', 'cza', 'label'), 1018, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (26, 'biblios', 'pubdate', oils_i18n_gettext(26, 'Publication Date', 'cza', 'label'), 31, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (27, 'biblios', 'item_type', oils_i18n_gettext(27, 'Item Type', 'cza', 'label'), 1001, 1);


SELECT SETVAL('config.z3950_attr_id_seq'::TEXT, 100);

--005.schema.actors.sql:

-- The PINES levels
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent, can_have_users, can_have_vols) VALUES 
    ( 1, oils_i18n_gettext(1, 'Consortium', 'aout', 'name'),
	oils_i18n_gettext(1, 'Everywhere', 'aout', 'opac_label'), 0, NULL, FALSE, FALSE );
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent, can_have_users, can_have_vols) VALUES 
    ( 2, oils_i18n_gettext(2, 'System', 'aout', 'name'),
	oils_i18n_gettext(2, 'Local Library System', 'aout', 'opac_label'), 1, 1, FALSE, FALSE );
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent) VALUES 
    ( 3, oils_i18n_gettext(3, 'Branch', 'aout', 'name'),
	oils_i18n_gettext(3, 'This Branch', 'aout', 'opac_label'), 2, 2 );
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent) VALUES 
    ( 4, oils_i18n_gettext(4, 'Sub-library', 'aout', 'name'),
	oils_i18n_gettext(4, 'This Specialized Library', 'aout', 'opac_label'), 3, 3 );
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent) VALUES 
    ( 5, oils_i18n_gettext(5, 'Bookmobile', 'aout', 'name'),
	oils_i18n_gettext(5, 'Your Bookmobile', 'aout', 'opac_label'), 3, 3 );
SELECT SETVAL('actor.org_unit_type_id_seq'::TEXT, 100);

INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (1, NULL, 1, 'CONS', oils_i18n_gettext(1, 'Example Consortium', 'aou', 'name'));
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (2, 1, 2, 'SYS1', oils_i18n_gettext(2, 'Example System 1', 'aou', 'name'));
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (3, 1, 2, 'SYS2', oils_i18n_gettext(3, 'Example System 2', 'aou', 'name'));
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (4, 2, 3, 'BR1', oils_i18n_gettext(4, 'Example Branch 1', 'aou', 'name'));
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (5, 2, 3, 'BR2', oils_i18n_gettext(5, 'Example Branch 2', 'aou', 'name'));
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (6, 3, 3, 'BR3', oils_i18n_gettext(6, 'Example Branch 3', 'aou', 'name'));
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (7, 3, 3, 'BR4', oils_i18n_gettext(7, 'Example Branch 4', 'aou', 'name'));
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (8, 4, 4, 'SL1', oils_i18n_gettext(8, 'Example Sub-library 1', 'aou', 'name'));
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (9, 6, 5, 'BM1', oils_i18n_gettext(9, 'Example Bookmobile 1', 'aou', 'name'));
SELECT SETVAL('actor.org_unit_id_seq'::TEXT, 100);

INSERT INTO actor.org_address VALUES (DEFAULT,DEFAULT,DEFAULT,1,'123 Main St.',NULL,'Anywhere',NULL,'GA','US','30303');

UPDATE actor.org_unit SET holds_address = 1, ill_address = 1, billing_address = 1, mailing_address = 1;

-- In booking, elbow room defines:
--  a) how far in the future you must make a reservation on a given item if
--      that item will have to transit somewhere to fulfill the reservation.
--  b) how soon a reservation must be starting for the reserved item to
--      be op-captured by the checkin interface.
INSERT INTO actor.org_unit_setting (org_unit, name, value) VALUES (
    (SELECT id FROM actor.org_unit WHERE parent_ou IS NULL),
    'circ.booking_reservation.default_elbow_room',
    '"1 day"'
);

INSERT INTO config.billing_type (id, name, owner) VALUES
	( 1, oils_i18n_gettext(1, 'Overdue Materials', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 2, oils_i18n_gettext(2, 'Long Overdue Collection Fee', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 3, oils_i18n_gettext(3, 'Lost Materials', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 4, oils_i18n_gettext(4, 'Lost Materials Processing Fee', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 5, oils_i18n_gettext(5, 'System: Deposit', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 6, oils_i18n_gettext(6, 'System: Rental', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 7, oils_i18n_gettext(7, 'Damaged Item', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 8, oils_i18n_gettext(8, 'Damaged Item Processing Fee', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 9, oils_i18n_gettext(9, 'Notification Fee', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
    ( 101, oils_i18n_gettext(101, 'Misc', 'cbt', 'name'), 1);

SELECT SETVAL('config.billing_type_id_seq'::TEXT, 101);


--006.data.permissions.sql:
INSERT INTO permission.perm_list VALUES 
    (-1, 'EVERYTHING', NULL);
INSERT INTO permission.perm_list VALUES 
    (2, 'OPAC_LOGIN', oils_i18n_gettext(2, 'Allow a user to log in to the OPAC', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (4, 'STAFF_LOGIN', oils_i18n_gettext(4, 'Allow a user to log in to the staff client', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (5, 'MR_HOLDS', oils_i18n_gettext(5, 'Allow a user to create a metarecord holds', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (6, 'TITLE_HOLDS', oils_i18n_gettext(6, 'Allow a user to place a hold at the title level', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (7, 'VOLUME_HOLDS', oils_i18n_gettext(7, 'Allow a user to place a volume level hold', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (8, 'COPY_HOLDS', oils_i18n_gettext(8, 'Allow a user to place a hold on a specific copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (9, 'REQUEST_HOLDS', oils_i18n_gettext(9, 'Allow a user to create holds for another user (if true, we still check to make sure they have permission to make the type of hold they are requesting, for example, COPY_HOLDS)', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (10, 'REQUEST_HOLDS_OVERRIDE', oils_i18n_gettext(10, '* no longer applicable', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (11, 'VIEW_HOLD', oils_i18n_gettext(11, 'Allow a user to view another user''s holds', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (13, 'DELETE_HOLDS', oils_i18n_gettext(13, '* no longer applicable', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (14, 'UPDATE_HOLD', oils_i18n_gettext(14, 'Allow a user to update another user''s hold', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (15, 'RENEW_CIRC', oils_i18n_gettext(15, 'Allow a user to renew items', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (16, 'VIEW_USER_FINES_SUMMARY', oils_i18n_gettext(16, 'Allow a user to view bill details', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (17, 'VIEW_USER_TRANSACTIONS', oils_i18n_gettext(17, 'Allow a user to see another user''s grocery or circulation transactions in the Bills Interface; duplicate of VIEW_TRANSACTION', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (18, 'UPDATE_MARC', oils_i18n_gettext(18, 'Allow a user to edit a MARC record', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (19, 'CREATE_MARC', oils_i18n_gettext(19, 'Allow a user to create new MARC records', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (20, 'IMPORT_MARC', oils_i18n_gettext(20, 'Allow a user to import a MARC record via the Z39.50 interface', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (21, 'CREATE_VOLUME', oils_i18n_gettext(21, 'Allow a user to create a volume', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (22, 'UPDATE_VOLUME', oils_i18n_gettext(22, 'Allow a user to edit volumes - needed for merging records. This is a duplicate of VOLUME_UPDATE; user must have both permissions at appropriate level to merge records.', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (23, 'DELETE_VOLUME', oils_i18n_gettext(23, 'Allow a user to delete a volume', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (25, 'UPDATE_COPY', oils_i18n_gettext(25, 'Allow a user to edit a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (26, 'DELETE_COPY', oils_i18n_gettext(26, 'Allow a user to delete a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (27, 'RENEW_HOLD_OVERRIDE', oils_i18n_gettext(27, 'Allow a user to continue to renew an item even if it is required for a hold', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (28, 'CREATE_USER', oils_i18n_gettext(28, 'Allow a user to create another user', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (29, 'UPDATE_USER', oils_i18n_gettext(29, 'Allow a user to edit a user''s record', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (30, 'DELETE_USER', oils_i18n_gettext(30, 'Allow a user to mark a user as deleted', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (31, 'VIEW_USER', oils_i18n_gettext(31, 'Allow a user to view another user''s Patron Record', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (32, 'COPY_CHECKIN', oils_i18n_gettext(32, 'Allow a user to check in a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (33, 'CREATE_TRANSIT', oils_i18n_gettext(33, 'Allow a user to place an item in transit', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (34, 'VIEW_PERMISSION', oils_i18n_gettext(34, 'Allow a user to view user permissions within the user permissions editor', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (35, 'CHECKIN_BYPASS_HOLD_FULFILL', oils_i18n_gettext(35, '* no longer applicable', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (36, 'CREATE_PAYMENT', oils_i18n_gettext(36, 'Allow a user to record payments in the Billing Interface', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (37, 'SET_CIRC_LOST', oils_i18n_gettext(37, 'Allow a user to mark an item as ''lost''', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (38, 'SET_CIRC_MISSING', oils_i18n_gettext(38, 'Allow a user to mark an item as ''missing''', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (39, 'SET_CIRC_CLAIMS_RETURNED', oils_i18n_gettext(39, 'Allow a user to mark an item as ''claims returned''', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (41, 'CREATE_TRANSACTION', oils_i18n_gettext(41, 'Allow a user to create a new billable transaction', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (43, 'CREATE_BILL', oils_i18n_gettext(43, 'Allow a user to create a new bill on a transaction', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (44, 'VIEW_CONTAINER', oils_i18n_gettext(44, 'Allow a user to view another user''s containers (buckets)', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (45, 'CREATE_CONTAINER', oils_i18n_gettext(45, 'Allow a user to create a new container for another user', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (24, 'CREATE_COPY', oils_i18n_gettext(24, 'Allow a user to create a new copy object', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (47, 'UPDATE_ORG_UNIT', oils_i18n_gettext(47, 'Allow a user to change the settings for an organization unit', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (48, 'VIEW_CIRCULATIONS', oils_i18n_gettext(48, 'Allow a user to see what another user has checked out', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (42, 'VIEW_TRANSACTION', oils_i18n_gettext(42, 'Allow a user may view another user''s transactions', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (49, 'DELETE_CONTAINER', oils_i18n_gettext(49, 'Allow a user to delete another user''s container', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (50, 'CREATE_CONTAINER_ITEM', oils_i18n_gettext(50, 'Allow a user to create a container item for another user', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (51, 'CREATE_USER_GROUP_LINK', oils_i18n_gettext(51, 'Allow a user to add other users to permission groups', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (52, 'REMOVE_USER_GROUP_LINK', oils_i18n_gettext(52, 'Allow a user to remove other users from permission groups', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (53, 'VIEW_PERM_GROUPS', oils_i18n_gettext(53, 'Allow a user to view other users'' permission groups', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (54, 'VIEW_PERMIT_CHECKOUT', oils_i18n_gettext(54, 'Allow a user to determine whether another user can check out an item', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (55, 'UPDATE_BATCH_COPY', oils_i18n_gettext(55, 'Allow a user to edit copies in batch', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (56, 'CREATE_PATRON_STAT_CAT', oils_i18n_gettext(56, 'User may create a new patron statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (57, 'CREATE_COPY_STAT_CAT', oils_i18n_gettext(57, 'User may create a copy statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (58, 'CREATE_PATRON_STAT_CAT_ENTRY', oils_i18n_gettext(58, 'User may create an entry in a patron statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (59, 'CREATE_COPY_STAT_CAT_ENTRY', oils_i18n_gettext(59, 'User may create an entry in a copy statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (60, 'UPDATE_PATRON_STAT_CAT', oils_i18n_gettext(60, 'User may update a patron statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (61, 'UPDATE_COPY_STAT_CAT', oils_i18n_gettext(61, 'User may update a copy statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (62, 'UPDATE_PATRON_STAT_CAT_ENTRY', oils_i18n_gettext(62, 'User may update an entry in a patron statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (63, 'UPDATE_COPY_STAT_CAT_ENTRY', oils_i18n_gettext(63, 'User may update an entry in a copy statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (65, 'CREATE_COPY_STAT_CAT_ENTRY_MAP', oils_i18n_gettext(65, 'User may link a copy to an entry in a statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (64, 'CREATE_PATRON_STAT_CAT_ENTRY_MAP', oils_i18n_gettext(64, 'User may link another user to an entry in a statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (66, 'DELETE_PATRON_STAT_CAT', oils_i18n_gettext(66, 'User may delete a patron statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (67, 'DELETE_COPY_STAT_CAT', oils_i18n_gettext(67, 'User may delete a copy statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (68, 'DELETE_PATRON_STAT_CAT_ENTRY', oils_i18n_gettext(68, 'User may delete an entry from a patron statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (69, 'DELETE_COPY_STAT_CAT_ENTRY', oils_i18n_gettext(69, 'User may delete an entry from a copy statistical category', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (70, 'DELETE_PATRON_STAT_CAT_ENTRY_MAP', oils_i18n_gettext(70, 'User may delete a patron statistical category entry map', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (71, 'DELETE_COPY_STAT_CAT_ENTRY_MAP', oils_i18n_gettext(71, 'User may delete a copy statistical category entry map', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (72, 'CREATE_NON_CAT_TYPE', oils_i18n_gettext(72, 'Allow a user to create a new non-cataloged item type', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (73, 'UPDATE_NON_CAT_TYPE', oils_i18n_gettext(73, 'Allow a user to update a non-cataloged item type', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (74, 'CREATE_IN_HOUSE_USE', oils_i18n_gettext(74, 'Allow a user to create a new in-house-use ', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (75, 'COPY_CHECKOUT', oils_i18n_gettext(75, 'Allow a user to check out a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (76, 'CREATE_COPY_LOCATION', oils_i18n_gettext(76, 'Allow a user to create a new copy location', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (77, 'UPDATE_COPY_LOCATION', oils_i18n_gettext(77, 'Allow a user to update a copy location', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (78, 'DELETE_COPY_LOCATION', oils_i18n_gettext(78, 'Allow a user to delete a copy location', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (79, 'CREATE_COPY_TRANSIT', oils_i18n_gettext(79, 'Allow a user to create a transit_copy object for transiting a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (80, 'COPY_TRANSIT_RECEIVE', oils_i18n_gettext(80, 'Allow a user to close out a transit on a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (81, 'VIEW_HOLD_PERMIT', oils_i18n_gettext(81, 'Allow a user to see if another user has permission to place a hold on a given copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (82, 'VIEW_COPY_CHECKOUT_HISTORY', oils_i18n_gettext(82, 'Allow a user to view which users have checked out a given copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (83, 'REMOTE_Z3950_QUERY', oils_i18n_gettext(83, 'Allow a user to perform Z39.50 queries against remote servers', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (84, 'REGISTER_WORKSTATION', oils_i18n_gettext(84, 'Allow a user to register a new workstation', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (85, 'VIEW_COPY_NOTES', oils_i18n_gettext(85, 'Allow a user to view all notes attached to a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (86, 'VIEW_VOLUME_NOTES', oils_i18n_gettext(86, 'Allow a user to view all notes attached to a volume', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (87, 'VIEW_TITLE_NOTES', oils_i18n_gettext(87, 'Allow a user to view all notes attached to a title', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (89, 'CREATE_VOLUME_NOTE', oils_i18n_gettext(89, 'Allow a user to create a new volume note', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (88, 'CREATE_COPY_NOTE', oils_i18n_gettext(88, 'Allow a user to create a new copy note', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (90, 'CREATE_TITLE_NOTE', oils_i18n_gettext(90, 'Allow a user to create a new title note', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (91, 'DELETE_COPY_NOTE', oils_i18n_gettext(91, 'Allow a user to delete another user''s copy notes', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (92, 'DELETE_VOLUME_NOTE', oils_i18n_gettext(92, 'Allow a user to delete another user''s volume note', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (93, 'DELETE_TITLE_NOTE', oils_i18n_gettext(93, 'Allow a user to delete another user''s title note', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (94, 'UPDATE_CONTAINER', oils_i18n_gettext(94, 'Allow a user to update another user''s container', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (95, 'CREATE_MY_CONTAINER', oils_i18n_gettext(95, 'Allow a user to create a container for themselves', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (96, 'VIEW_HOLD_NOTIFICATION', oils_i18n_gettext(96, 'Allow a user to view notifications attached to a hold', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (97, 'CREATE_HOLD_NOTIFICATION', oils_i18n_gettext(97, 'Allow a user to create new hold notifications', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (98, 'UPDATE_ORG_SETTING', oils_i18n_gettext(98, 'Allow a user to update an organization unit setting', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (99, 'OFFLINE_UPLOAD', oils_i18n_gettext(99, 'Allow a user to upload an offline script', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (100, 'OFFLINE_VIEW', oils_i18n_gettext(100, 'Allow a user to view uploaded offline script information', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (101, 'OFFLINE_EXECUTE', oils_i18n_gettext(101, 'Allow a user to execute an offline script batch', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (102, 'CIRC_OVERRIDE_DUE_DATE', oils_i18n_gettext(102, 'Allow a user to change the due date on an item to any date', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (103, 'CIRC_PERMIT_OVERRIDE', oils_i18n_gettext(103, 'Allow a user to bypass the circulation permit call for check out', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (104, 'COPY_IS_REFERENCE.override', oils_i18n_gettext(104, 'Allow a user to override the copy_is_reference event', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (105, 'VOID_BILLING', oils_i18n_gettext(105, 'Allow a user to void a bill', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (106, 'CIRC_CLAIMS_RETURNED.override', oils_i18n_gettext(106, 'Allow a user to check in or check out an item that has a status of ''claims returned''', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (107, 'COPY_BAD_STATUS.override', oils_i18n_gettext(107, 'Allow a user to check out an item in a non-circulatable status', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (108, 'COPY_ALERT_MESSAGE.override', oils_i18n_gettext(108, 'Allow a user to check in/out an item that has an alert message', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (109, 'COPY_STATUS_LOST.override', oils_i18n_gettext(109, 'Allow a user to remove the lost status from a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (110, 'COPY_STATUS_MISSING.override', oils_i18n_gettext(110, 'Allow a user to change the missing status on a copy', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (111, 'ABORT_TRANSIT', oils_i18n_gettext(111, 'Allow a user to abort a copy transit if the user is at the transit destination or source', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (112, 'ABORT_REMOTE_TRANSIT', oils_i18n_gettext(112, 'Allow a user to abort a copy transit if the user is not at the transit source or dest', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (113, 'VIEW_ZIP_DATA', oils_i18n_gettext(113, 'Allow a user to query the ZIP code data method', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (114, 'CANCEL_HOLDS', oils_i18n_gettext(114, 'Allow a user to cancel holds', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (115, 'CREATE_DUPLICATE_HOLDS', oils_i18n_gettext(115, 'Allow a user to create duplicate holds (two or more holds on the same title)', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (117, 'actor.org_unit.closed_date.update', oils_i18n_gettext(117, 'Allow a user to update a closed date interval for a given location', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (116, 'actor.org_unit.closed_date.delete', oils_i18n_gettext(116, 'Allow a user to remove a closed date interval for a given location', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (118, 'actor.org_unit.closed_date.create', oils_i18n_gettext(118, 'Allow a user to create a new closed date for a location', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (119, 'DELETE_NON_CAT_TYPE', oils_i18n_gettext(119, 'Allow a user to delete a non cataloged type', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (120, 'money.collections_tracker.create', oils_i18n_gettext(120, 'Allow a user to put someone into collections', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (121, 'money.collections_tracker.delete', oils_i18n_gettext(121, 'Allow a user to remove someone from collections', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (122, 'BAR_PATRON', oils_i18n_gettext(122, 'Allow a user to bar a patron', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (123, 'UNBAR_PATRON', oils_i18n_gettext(123, 'Allow a user to un-bar a patron', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (124, 'DELETE_WORKSTATION', oils_i18n_gettext(124, 'Allow a user to remove an existing workstation so a new one can replace it', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (125, 'group_application.user', oils_i18n_gettext(125, 'Allow a user to add/remove users to/from the "User" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (126, 'group_application.user.patron', oils_i18n_gettext(126, 'Allow a user to add/remove users to/from the "Patron" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (127, 'group_application.user.staff', oils_i18n_gettext(127, 'Allow a user to add/remove users to/from the "Staff" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (128, 'group_application.user.staff.circ', oils_i18n_gettext(128, 'Allow a user to add/remove users to/from the "Circulator" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (129, 'group_application.user.staff.cat', oils_i18n_gettext(129, 'Allow a user to add/remove users to/from the "Cataloger" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (130, 'group_application.user.staff.admin.global_admin', oils_i18n_gettext(130, 'Allow a user to add/remove users to/from the "GlobalAdmin" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (131, 'group_application.user.staff.admin.local_admin', oils_i18n_gettext(131, 'Allow a user to add/remove users to/from the "LocalAdmin" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (132, 'group_application.user.staff.admin.lib_manager', oils_i18n_gettext(132, 'Allow a user to add/remove users to/from the "LibraryManager" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (133, 'group_application.user.staff.cat.cat1', oils_i18n_gettext(133, 'Allow a user to add/remove users to/from the "Cat1" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (134, 'group_application.user.staff.supercat', oils_i18n_gettext(134, 'Allow a user to add/remove users to/from the "Supercat" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (135, 'group_application.user.sip_client', oils_i18n_gettext(135, 'Allow a user to add/remove users to/from the "SIP-Client" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (136, 'group_application.user.vendor', oils_i18n_gettext(136, 'Allow a user to add/remove users to/from the "Vendor" group', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (137, 'ITEM_AGE_PROTECTED.override', oils_i18n_gettext(137, 'Allow a user to place a hold on an age-protected item', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (138, 'MAX_RENEWALS_REACHED.override', oils_i18n_gettext(138, 'Allow a user to renew an item past the maximum renewal count', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (139, 'PATRON_EXCEEDS_CHECKOUT_COUNT.override', oils_i18n_gettext(139, 'Allow staff to override checkout count failure', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (140, 'PATRON_EXCEEDS_OVERDUE_COUNT.override', oils_i18n_gettext(140, 'Allow staff to override overdue count failure', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (141, 'PATRON_EXCEEDS_FINES.override', oils_i18n_gettext(141, 'Allow staff to override fine amount checkout failure', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (142, 'CIRC_EXCEEDS_COPY_RANGE.override', oils_i18n_gettext(142, 'Allow staff to override circulation copy range failure', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (143, 'ITEM_ON_HOLDS_SHELF.override', oils_i18n_gettext(143, 'Allow staff to override item on holds shelf failure', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (144, 'COPY_NOT_AVAILABLE.override', oils_i18n_gettext(144, 'Allow staff to force checkout of Missing/Lost type items', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (146, 'HOLD_EXISTS.override', oils_i18n_gettext(146, 'Allow a user to place multiple holds on a single title', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (147, 'RUN_REPORTS', oils_i18n_gettext(147, 'Allow a user to run reports', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (148, 'SHARE_REPORT_FOLDER', oils_i18n_gettext(148, 'Allow a user to share report his own folders', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (149, 'VIEW_REPORT_OUTPUT', oils_i18n_gettext(149, 'Allow a user to view report output', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (150, 'COPY_CIRC_NOT_ALLOWED.override', oils_i18n_gettext(150, 'Allow a user to checkout an item that is marked as non-circ', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (151, 'DELETE_CONTAINER_ITEM', oils_i18n_gettext(151, 'Allow a user to delete an item out of another user''s container', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (152, 'ASSIGN_WORK_ORG_UNIT', oils_i18n_gettext(152, 'Allow a staff member to define where another staff member has their permissions', 'ppl', 'description'));
INSERT INTO permission.perm_list VALUES 
    (153, 'CREATE_FUNDING_SOURCE', oils_i18n_gettext(153, 'Allow a user to create a new funding source', 'ppl', 'description')),
    (154, 'DELETE_FUNDING_SOURCE', oils_i18n_gettext(154, 'Allow a user to delete a funding source', 'ppl', 'description')),
    (155, 'VIEW_FUNDING_SOURCE', oils_i18n_gettext(155, 'Allow a user to view a funding source', 'ppl', 'description')),
    (156, 'UPDATE_FUNDING_SOURCE', oils_i18n_gettext(156, 'Allow a user to update a funding source', 'ppl', 'description')),
    (157, 'CREATE_FUND', oils_i18n_gettext(157, 'Allow a user to create a new fund', 'ppl', 'description')),
    (158, 'DELETE_FUND', oils_i18n_gettext(158, 'Allow a user to delete a fund', 'ppl', 'description')),
    (159, 'VIEW_FUND', oils_i18n_gettext(159, 'Allow a user to view a fund', 'ppl', 'description')),
    (160, 'UPDATE_FUND', oils_i18n_gettext(160, 'Allow a user to update a fund', 'ppl', 'description')),
    (161, 'CREATE_FUND_ALLOCATION', oils_i18n_gettext(161, 'Allow a user to create a new fund allocation', 'ppl', 'description')),
    (162, 'DELETE_FUND_ALLOCATION', oils_i18n_gettext(162, 'Allow a user to delete a fund allocation', 'ppl', 'description')),
    (163, 'VIEW_FUND_ALLOCATION', oils_i18n_gettext(163, 'Allow a user to view a fund allocation', 'ppl', 'description')),
    (164, 'UPDATE_FUND_ALLOCATION', oils_i18n_gettext(164, 'Allow a user to update a fund allocation', 'ppl', 'description')),
    (165, 'GENERAL_ACQ', oils_i18n_gettext(165, 'Lowest level permission required to access the ACQ interface', 'ppl', 'description')),
    (166, 'CREATE_PROVIDER', oils_i18n_gettext(166, 'Allow a user to create a new provider', 'ppl', 'description')),
    (167, 'DELETE_PROVIDER', oils_i18n_gettext(167, 'Allow a user to delate a provider', 'ppl', 'description')),
    (168, 'VIEW_PROVIDER', oils_i18n_gettext(168, 'Allow a user to view a provider', 'ppl', 'description')),
    (169, 'UPDATE_PROVIDER', oils_i18n_gettext(169, 'Allow a user to update a provider', 'ppl', 'description')),
    (170, 'ADMIN_FUNDING_SOURCE', oils_i18n_gettext(170, 'Allow a user to create/view/update/delete a funding source', 'ppl', 'description')),
    (171, 'ADMIN_FUND', oils_i18n_gettext(171, '(Deprecated) Allow a user to create/view/update/delete a fund', 'ppl', 'description')),
    (172, 'MANAGE_FUNDING_SOURCE', oils_i18n_gettext(172, 'Allow a user to view/credit/debit a funding source', 'ppl', 'description')),
    (173, 'MANAGE_FUND', oils_i18n_gettext(173, 'Allow a user to view/credit/debit a fund', 'ppl', 'description')),
    (174, 'CREATE_PICKLIST', oils_i18n_gettext(174, 'Allows a user to create a picklist', 'ppl', 'description')),
    (175, 'ADMIN_PROVIDER', oils_i18n_gettext(175, 'Allow a user to create/view/update/delete a provider', 'ppl', 'description')),
    (176, 'MANAGE_PROVIDER', oils_i18n_gettext(176, 'Allow a user to view and purchase from a provider', 'ppl', 'description')),
    (177, 'VIEW_PICKLIST', oils_i18n_gettext(177, 'Allow a user to view another users picklist', 'ppl', 'description')),
    (178, 'DELETE_RECORD', oils_i18n_gettext(178, 'Allow a staff member to directly remove a bibliographic record', 'ppl', 'description')),
    (179, 'ADMIN_CURRENCY_TYPE', oils_i18n_gettext(179, 'Allow a user to create/view/update/delete a currency_type', 'ppl', 'description')),
    (180, 'MARK_BAD_DEBT', oils_i18n_gettext(180, 'Allow a user to mark a transaction as bad (unrecoverable) debt', 'ppl', 'description')),
    (181, 'VIEW_BILLING_TYPE', oils_i18n_gettext(181, 'Allow a user to view billing types', 'ppl', 'description')),
    (182, 'MARK_ITEM_AVAILABLE', oils_i18n_gettext(182, 'Allow a user to mark an item status as ''available''', 'ppl', 'description')),
    (183, 'MARK_ITEM_CHECKED_OUT', oils_i18n_gettext(183, 'Allow a user to mark an item status as ''checked out''', 'ppl', 'description')),
    (184, 'MARK_ITEM_BINDERY', oils_i18n_gettext(184, 'Allow a user to mark an item status as ''bindery''', 'ppl', 'description')),
    (185, 'MARK_ITEM_LOST', oils_i18n_gettext(185, 'Allow a user to mark an item status as ''lost''', 'ppl', 'description')),
    (186, 'MARK_ITEM_MISSING', oils_i18n_gettext(186, 'Allow a user to mark an item status as ''missing''', 'ppl', 'description')),
    (187, 'MARK_ITEM_IN_PROCESS', oils_i18n_gettext(187, 'Allow a user to mark an item status as ''in process''', 'ppl', 'description')),
    (188, 'MARK_ITEM_IN_TRANSIT', oils_i18n_gettext(188, 'Allow a user to mark an item status as ''in transit''', 'ppl', 'description')),
    (189, 'MARK_ITEM_RESHELVING', oils_i18n_gettext(189, 'Allow a user to mark an item status as ''reshelving''', 'ppl', 'description')),
    (190, 'MARK_ITEM_ON_HOLDS_SHELF', oils_i18n_gettext(190, 'Allow a user to mark an item status as ''on holds shelf''', 'ppl', 'description')),
    (191, 'MARK_ITEM_ON_ORDER', oils_i18n_gettext(191, 'Allow a user to mark an item status as ''on order''', 'ppl', 'description')),
    (192, 'MARK_ITEM_ILL', oils_i18n_gettext(192, 'Allow a user to mark an item status as ''inter-library loan''', 'ppl', 'description')),
    (193, 'group_application.user.staff.acq', oils_i18n_gettext(193, 'Allows a user to add/remove/edit users in the "ACQ" group', 'ppl', 'description')),
    (194, 'CREATE_PURCHASE_ORDER', oils_i18n_gettext(194, 'Allows a user to create a purchase order', 'ppl', 'description')),
    (195, 'VIEW_PURCHASE_ORDER', oils_i18n_gettext(195, 'Allows a user to view a purchase order', 'ppl', 'description')),
    (196, 'IMPORT_ACQ_LINEITEM_BIB_RECORD', oils_i18n_gettext(196, 'Allows a user to import a bib record from the acq staging area (on-order record) into the ILS bib data set', 'ppl', 'description')),
    (197, 'RECEIVE_PURCHASE_ORDER', oils_i18n_gettext(197, 'Allows a user to mark a purchase order, lineitem, or individual copy as received', 'ppl', 'description')),
    (198, 'VIEW_ORG_SETTINGS', oils_i18n_gettext(198, 'Allows a user to view all org settings at the specified level', 'ppl', 'description')),
    (199, 'CREATE_MFHD_RECORD', oils_i18n_gettext(199, 'Allows a user to create a new MFHD record', 'ppl', 'description')),
    (200, 'UPDATE_MFHD_RECORD', oils_i18n_gettext(200, 'Allows a user to update an MFHD record', 'ppl', 'description')),
    (201, 'DELETE_MFHD_RECORD', oils_i18n_gettext(201, 'Allows a user to delete an MFHD record', 'ppl', 'description')),
    (202, 'ADMIN_ACQ_FUND', oils_i18n_gettext(202, 'Allow a user to create/view/update/delete a fund', 'ppl', 'description')),
    (203, 'group_application.user.staff.acq_admin', oils_i18n_gettext(203, 'Allows a user to add/remove/edit users in the "Acquisitions Administrators" group', 'ppl', 'description')),
    (351, 'HOLD_LOCAL_AVAIL_OVERRIDE', oils_i18n_gettext(351, 'Allow a user to place a hold despite the availability of a local copy', 'ppl', 'description')),
    (352, 'ADMIN_BOOKING_RESOURCE', oils_i18n_gettext(352, 'Enables the user to create/update/delete booking resources', 'ppl', 'description')),
    (353, 'ADMIN_BOOKING_RESOURCE_TYPE', oils_i18n_gettext(353, 'Enables the user to create/update/delete booking resource types', 'ppl', 'description')),
    (354, 'ADMIN_BOOKING_RESOURCE_ATTR', oils_i18n_gettext(354, 'Enables the user to create/update/delete booking resource attributes', 'ppl', 'description')),
    (355, 'ADMIN_BOOKING_RESOURCE_ATTR_MAP', oils_i18n_gettext(355, 'Enables the user to create/update/delete booking resource attribute maps', 'ppl', 'description')),
    (356, 'ADMIN_BOOKING_RESOURCE_ATTR_VALUE', oils_i18n_gettext(356, 'Enables the user to create/update/delete booking resource attribute values', 'ppl', 'description')),
    (357, 'ADMIN_BOOKING_RESERVATION', oils_i18n_gettext(357, 'Enables the user to create/update/delete booking reservations', 'ppl', 'description')),
    (358, 'ADMIN_BOOKING_RESERVATION_ATTR_VALUE_MAP', oils_i18n_gettext(358, 'Enables the user to create/update/delete booking reservation attribute value maps', 'ppl', 'description')),
    (359, 'HOLD_ITEM_CHECKED_OUT.override', oils_i18n_gettext(359, 'Allows a user to place a hold on an item that they already have checked out', 'ppl', 'description')),
    (360, 'RETRIEVE_RESERVATION_PULL_LIST', oils_i18n_gettext(360, 'Allows a user to retrieve a booking reservation pull list', 'ppl', 'description')),
    (361, 'CAPTURE_RESERVATION', oils_i18n_gettext(361, 'Allows a user to capture booking reservations', 'ppl', 'description'))
;

SELECT SETVAL('permission.perm_list_id_seq'::TEXT, (SELECT MAX(id) FROM permission.perm_list));

INSERT INTO permission.perm_list (code) VALUES ('ASSIGN_GROUP_PERM');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_AUDIENCE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_BIB_LEVEL');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_CIRC_DURATION');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_CIRC_MOD');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_COPY_STATUS');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_HOURS_OF_OPERATION');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_ITEM_FORM');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_ITEM_TYPE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_LANGUAGE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_LASSO');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_LASSO_MAP');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_LIT_FORM');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_METABIB_FIELD');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_NET_ACCESS_LEVEL');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_ORG_ADDRESS');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_ORG_TYPE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_ORG_UNIT');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_ORG_UNIT_CLOSING');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_PERM');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_RELEVANCE_ADJUSTMENT');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_SURVEY');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_VR_FORMAT');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_XML_TRANSFORM');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_AUDIENCE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_BIB_LEVEL');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_CIRC_DURATION');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_CIRC_MOD');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_COPY_STATUS');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_HOURS_OF_OPERATION');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_ITEM_FORM');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_ITEM_TYPE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_LANGUAGE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_LASSO');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_LASSO_MAP');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_LIT_FORM');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_METABIB_FIELD');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_NET_ACCESS_LEVEL');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_ORG_ADDRESS');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_ORG_TYPE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_ORG_UNIT');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_ORG_UNIT_CLOSING');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_PERM');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_RELEVANCE_ADJUSTMENT');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_SURVEY');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_TRANSIT');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_VR_FORMAT');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_XML_TRANSFORM');
INSERT INTO permission.perm_list (code) VALUES ('REMOVE_GROUP_PERM');
INSERT INTO permission.perm_list (code) VALUES ('TRANSIT_COPY');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_AUDIENCE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_BIB_LEVEL');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_CIRC_DURATION');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_CIRC_MOD');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_COPY_NOTE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_COPY_STATUS');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_GROUP_PERM');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_HOURS_OF_OPERATION');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ITEM_FORM');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ITEM_TYPE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_LANGUAGE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_LASSO');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_LASSO_MAP');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_LIT_FORM');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_METABIB_FIELD');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_NET_ACCESS_LEVEL');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_ADDRESS');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_TYPE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_CLOSING');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_PERM');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_RECORD');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_RELEVANCE_ADJUSTMENT');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_SURVEY');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_TRANSIT');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_VOLUME_NOTE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_VR_FORMAT');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_XML_TRANSFORM');
INSERT INTO permission.perm_list (code) VALUES ('MERGE_BIB_RECORDS');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_PICKUP_LIB_FROM_HOLDS_SHELF');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_ACQ_FUNDING_SOURCE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_AUTHORITY_IMPORT_QUEUE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_AUTHORITY_RECORD_NOTE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_BIB_IMPORT_FIELD_DEF');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_BIB_IMPORT_QUEUE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_LOCALE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_MARC_CODE');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_TRANSLATION');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_ACQ_FUNDING_SOURCE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_AUTHORITY_IMPORT_QUEUE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_AUTHORITY_RECORD_NOTE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_BIB_IMPORT_IMPORT_FIELD_DEF');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_BIB_IMPORT_QUEUE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_LOCALE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_MARC_CODE');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_TRANSLATION');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ACQ_FUNDING_SOURCE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_AUTHORITY_IMPORT_QUEUE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_AUTHORITY_RECORD_NOTE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_BIB_IMPORT_IMPORT_FIELD_DEF');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_BIB_IMPORT_QUEUE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_LOCALE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_MARC_CODE');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_TRANSLATION');
INSERT INTO permission.perm_list (code) VALUES ('VIEW_ACQ_FUNDING_SOURCE');
INSERT INTO permission.perm_list (code) VALUES ('VIEW_AUTHORITY_RECORD_NOTES');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_IMPORT_ITEM');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_IMPORT_ITEM_ATTR_DEF');
INSERT INTO permission.perm_list (code) VALUES ('CREATE_IMPORT_TRASH_FIELD');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_IMPORT_ITEM');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_IMPORT_ITEM_ATTR_DEF');
INSERT INTO permission.perm_list (code) VALUES ('DELETE_IMPORT_TRASH_FIELD');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_IMPORT_ITEM');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_IMPORT_ITEM_ATTR_DEF');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_IMPORT_TRASH_FIELD');

-- ORG UNIT Settings
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING_ALL');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.lost_materials_processing_fee');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.cat.default_item_price');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.auth.opac_timeout');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.auth.staff_timeout');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.org.bounced_emails');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.hold_expire_alert_interval');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.hold_expire_interval');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.global.credit.allow');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.void_overdue_on_lost');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.hold_stalling.soft');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.hold_boundary.hard');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.hold_boundary.soft');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.opac.barcode_regex');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.global.password_regex');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.item_checkout_history.max');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.reshelving_complete.interval');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.selfcheck.patron_login_timeout');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.selfcheck.alert_on_checkout_event');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.selfcheck.require_patron_password');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.global.juvenile_age_threshold');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.cat.bib.keep_on_empty');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.cat.bib.alert_on_empty');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.patron.password.use_phone');
INSERT INTO permission.perm_list (code) VALUES ('UPDATE_ORG_UNIT_SETTING.circ.block_renews_for_holds');

SELECT SETVAL('permission.perm_list_id_seq'::TEXT, 1000);

INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(1, oils_i18n_gettext(1, 'Users', 'pgt', 'name'), NULL, NULL, '3 years', FALSE, 'group_application.user');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(2, oils_i18n_gettext(2, 'Patrons', 'pgt', 'name'), 1, NULL, '3 years', TRUE, 'group_application.user.patron');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(3, oils_i18n_gettext(3, 'Staff', 'pgt', 'name'), 1, NULL, '3 years', FALSE, 'group_application.user.staff');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(4, oils_i18n_gettext(4, 'Catalogers', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.cat');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(5, oils_i18n_gettext(5, 'Circulators', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.circ');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(6, oils_i18n_gettext(6, 'Acquisitions', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.acq');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(7, oils_i18n_gettext(6, 'Acquisitions Administrator', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.acq_admin');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(10, oils_i18n_gettext(10, 'Local System Administrator', 'pgt', 'name'), 3, 
	oils_i18n_gettext(10, 'System maintenance, configuration, etc.', 'pgt', 'description'), '3 years', TRUE, 'group_application.user.staff.admin.local_admin');

SELECT SETVAL('permission.grp_tree_id_seq'::TEXT, (SELECT MAX(id) FROM permission.grp_tree));

INSERT INTO permission.grp_penalty_threshold (grp,org_unit,penalty,threshold)
    VALUES (1,1,1,10.0);
INSERT INTO permission.grp_penalty_threshold (grp,org_unit,penalty,threshold)
    VALUES (1,1,2,10.0);
INSERT INTO permission.grp_penalty_threshold (grp,org_unit,penalty,threshold)
    VALUES (1,1,3,10.0);

SELECT SETVAL('permission.grp_penalty_threshold_id_seq'::TEXT, (SELECT MAX(id) FROM permission.grp_penalty_threshold));

-- XXX Incomplete base permission setup.  A patch would be appreciated.
INSERT INTO permission.grp_perm_map VALUES (57, 2, 15, 0, false);
INSERT INTO permission.grp_perm_map VALUES (109, 2, 95, 0, false);
INSERT INTO permission.grp_perm_map VALUES (1, 1, 2, 0, false);
INSERT INTO permission.grp_perm_map VALUES (12, 1, 5, 0, false);
INSERT INTO permission.grp_perm_map VALUES (13, 1, 6, 0, false);
INSERT INTO permission.grp_perm_map VALUES (51, 1, 32, 0, false);
INSERT INTO permission.grp_perm_map VALUES (111, 1, 95, 0, false);
INSERT INTO permission.grp_perm_map VALUES (11, 3, 4, 0, false);
INSERT INTO permission.grp_perm_map VALUES (14, 3, 7, 2, false);
INSERT INTO permission.grp_perm_map VALUES (16, 3, 9, 0, false);
INSERT INTO permission.grp_perm_map VALUES (19, 3, 15, 0, false);
INSERT INTO permission.grp_perm_map VALUES (20, 3, 16, 0, false);
INSERT INTO permission.grp_perm_map VALUES (21, 3, 17, 0, false);
INSERT INTO permission.grp_perm_map VALUES (116, 3, 18, 0, false);
INSERT INTO permission.grp_perm_map VALUES (117, 3, 20, 0, false);
INSERT INTO permission.grp_perm_map VALUES (118, 3, 21, 2, false);
INSERT INTO permission.grp_perm_map VALUES (119, 3, 22, 2, false);
INSERT INTO permission.grp_perm_map VALUES (120, 3, 23, 2, false);
INSERT INTO permission.grp_perm_map VALUES (121, 3, 25, 2, false);
INSERT INTO permission.grp_perm_map VALUES (26, 3, 27, 0, false);
INSERT INTO permission.grp_perm_map VALUES (27, 3, 28, 0, false);
INSERT INTO permission.grp_perm_map VALUES (28, 3, 29, 0, false);
INSERT INTO permission.grp_perm_map VALUES (29, 3, 30, 0, false);
INSERT INTO permission.grp_perm_map VALUES (44, 3, 31, 0, false);
INSERT INTO permission.grp_perm_map VALUES (31, 3, 33, 0, false);
INSERT INTO permission.grp_perm_map VALUES (32, 3, 34, 0, false);
INSERT INTO permission.grp_perm_map VALUES (33, 3, 35, 0, false);
INSERT INTO permission.grp_perm_map VALUES (41, 3, 36, 0, false);
INSERT INTO permission.grp_perm_map VALUES (45, 3, 37, 0, false);
INSERT INTO permission.grp_perm_map VALUES (46, 3, 38, 0, false);
INSERT INTO permission.grp_perm_map VALUES (47, 3, 39, 0, false);
INSERT INTO permission.grp_perm_map VALUES (122, 3, 41, 0, false);
INSERT INTO permission.grp_perm_map VALUES (123, 3, 43, 0, false);
INSERT INTO permission.grp_perm_map VALUES (60, 3, 44, 0, false);
INSERT INTO permission.grp_perm_map VALUES (110, 3, 45, 0, false);
INSERT INTO permission.grp_perm_map VALUES (124, 3, 8, 2, false);
INSERT INTO permission.grp_perm_map VALUES (125, 3, 24, 2, false);
INSERT INTO permission.grp_perm_map VALUES (126, 3, 19, 0, false);
INSERT INTO permission.grp_perm_map VALUES (61, 3, 47, 2, false);
INSERT INTO permission.grp_perm_map VALUES (95, 3, 48, 0, false);
INSERT INTO permission.grp_perm_map VALUES (17, 3, 11, 0, false);
INSERT INTO permission.grp_perm_map VALUES (62, 3, 42, 0, false);
INSERT INTO permission.grp_perm_map VALUES (63, 3, 49, 0, false);
INSERT INTO permission.grp_perm_map VALUES (64, 3, 50, 0, false);
INSERT INTO permission.grp_perm_map VALUES (127, 3, 53, 0, false);
INSERT INTO permission.grp_perm_map VALUES (65, 3, 54, 0, false);
INSERT INTO permission.grp_perm_map VALUES (128, 3, 55, 2, false);
INSERT INTO permission.grp_perm_map VALUES (67, 3, 56, 2, false);
INSERT INTO permission.grp_perm_map VALUES (68, 3, 57, 2, false);
INSERT INTO permission.grp_perm_map VALUES (69, 3, 58, 2, false);
INSERT INTO permission.grp_perm_map VALUES (70, 3, 59, 2, false);
INSERT INTO permission.grp_perm_map VALUES (71, 3, 60, 2, false);
INSERT INTO permission.grp_perm_map VALUES (72, 3, 61, 2, false);
INSERT INTO permission.grp_perm_map VALUES (73, 3, 62, 2, false);
INSERT INTO permission.grp_perm_map VALUES (74, 3, 63, 2, false);
INSERT INTO permission.grp_perm_map VALUES (81, 3, 72, 2, false);
INSERT INTO permission.grp_perm_map VALUES (82, 3, 73, 2, false);
INSERT INTO permission.grp_perm_map VALUES (83, 3, 74, 2, false);
INSERT INTO permission.grp_perm_map VALUES (84, 3, 75, 0, false);
INSERT INTO permission.grp_perm_map VALUES (85, 3, 76, 2, false);
INSERT INTO permission.grp_perm_map VALUES (86, 3, 77, 2, false);
INSERT INTO permission.grp_perm_map VALUES (89, 3, 79, 0, false);
INSERT INTO permission.grp_perm_map VALUES (90, 3, 80, 0, false);
INSERT INTO permission.grp_perm_map VALUES (91, 3, 81, 0, false);
INSERT INTO permission.grp_perm_map VALUES (92, 3, 82, 0, false);
INSERT INTO permission.grp_perm_map VALUES (98, 3, 83, 0, false);
INSERT INTO permission.grp_perm_map VALUES (115, 3, 84, 0, false);
INSERT INTO permission.grp_perm_map VALUES (100, 3, 85, 0, false);
INSERT INTO permission.grp_perm_map VALUES (101, 3, 86, 0, false);
INSERT INTO permission.grp_perm_map VALUES (102, 3, 87, 0, false);
INSERT INTO permission.grp_perm_map VALUES (103, 3, 89, 2, false);
INSERT INTO permission.grp_perm_map VALUES (104, 3, 88, 2, false);
INSERT INTO permission.grp_perm_map VALUES (108, 3, 94, 0, false);
INSERT INTO permission.grp_perm_map VALUES (112, 3, 96, 0, false);
INSERT INTO permission.grp_perm_map VALUES (113, 3, 97, 0, false);
INSERT INTO permission.grp_perm_map VALUES (130, 3, 99, 1, false);
INSERT INTO permission.grp_perm_map VALUES (131, 3, 100, 1, false);
INSERT INTO permission.grp_perm_map VALUES (139, 3, 181, 0, false);
INSERT INTO permission.grp_perm_map VALUES (22, 4, 18, 0, false);
INSERT INTO permission.grp_perm_map VALUES (24, 4, 20, 0, false);
INSERT INTO permission.grp_perm_map VALUES (38, 4, 21, 2, false);
INSERT INTO permission.grp_perm_map VALUES (34, 4, 22, 2, false);
INSERT INTO permission.grp_perm_map VALUES (39, 4, 23, 2, false);
INSERT INTO permission.grp_perm_map VALUES (35, 4, 25, 2, false);
INSERT INTO permission.grp_perm_map VALUES (129, 4, 26, 2, false);
INSERT INTO permission.grp_perm_map VALUES (15, 4, 8, 2, false);
INSERT INTO permission.grp_perm_map VALUES (40, 4, 24, 2, false);
INSERT INTO permission.grp_perm_map VALUES (23, 4, 19, 0, false);
INSERT INTO permission.grp_perm_map VALUES (66, 4, 55, 2, false);
INSERT INTO permission.grp_perm_map VALUES (134, 10, 51, 1, false);
INSERT INTO permission.grp_perm_map VALUES (75, 10, 66, 2, false);
INSERT INTO permission.grp_perm_map VALUES (76, 10, 67, 2, false);
INSERT INTO permission.grp_perm_map VALUES (77, 10, 68, 2, false);
INSERT INTO permission.grp_perm_map VALUES (78, 10, 69, 2, false);
INSERT INTO permission.grp_perm_map VALUES (79, 10, 70, 2, false);
INSERT INTO permission.grp_perm_map VALUES (80, 10, 71, 2, false);
INSERT INTO permission.grp_perm_map VALUES (87, 10, 78, 2, false);
INSERT INTO permission.grp_perm_map VALUES (105, 10, 91, 1, false);
INSERT INTO permission.grp_perm_map VALUES (106, 10, 92, 1, false);
INSERT INTO permission.grp_perm_map VALUES (107, 10, 93, 0, false);
INSERT INTO permission.grp_perm_map VALUES (114, 10, 98, 1, false);
INSERT INTO permission.grp_perm_map VALUES (132, 10, 101, 1, true);
INSERT INTO permission.grp_perm_map VALUES (136, 10, 102, 1, false);
INSERT INTO permission.grp_perm_map VALUES (137, 10, 103, 1, false);
INSERT INTO permission.grp_perm_map VALUES (140, 10, 147, 1, false);
INSERT INTO permission.grp_perm_map VALUES (141, 10, 148, 1, false);
INSERT INTO permission.grp_perm_map VALUES (142, 10, 149, 1, false);
INSERT INTO permission.grp_perm_map VALUES (97, 5, 41, 0, false);
INSERT INTO permission.grp_perm_map VALUES (96, 5, 43, 0, false);
INSERT INTO permission.grp_perm_map VALUES (93, 5, 48, 0, false);
INSERT INTO permission.grp_perm_map VALUES (94, 5, 53, 0, false);
INSERT INTO permission.grp_perm_map VALUES (133, 5, 102, 0, false);
INSERT INTO permission.grp_perm_map VALUES (138, 5, 104, 1, false);
INSERT INTO permission.grp_perm_map VALUES (143, 3, 198, 1, false);
INSERT INTO permission.grp_perm_map VALUES (144, 4, 199, 1, false);
INSERT INTO permission.grp_perm_map VALUES (145, 4, 200, 1, false);
INSERT INTO permission.grp_perm_map VALUES (146, 4, 201, 1, false);

-- Add basic acquisitions permissions to the Acquisitions group
SELECT SETVAL('permission.grp_perm_map_id_seq'::TEXT, (SELECT MAX(id) FROM permission.grp_perm_map));
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'GENERAL_ACQ'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'VIEW_PICKLIST'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'CREATE_PICKLIST'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'CREATE_PURCHASE_ORDER'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'VIEW_PURCHASE_ORDER'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'RECEIVE_PURCHASE_ORDER'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'VIEW_PROVIDER'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'UPDATE_COPY'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (6, (SELECT id FROM permission.perm_list WHERE code = 'UPDATE_VOLUME'), 1, false);

-- Add acquisitions administration permissions to the Acquisitions group
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (7, (SELECT id FROM permission.perm_list WHERE code = 'ADMIN_PROVIDER'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (7, (SELECT id FROM permission.perm_list WHERE code = 'ADMIN_FUNDING_SOURCE'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (7, (SELECT id FROM permission.perm_list WHERE code = 'ADMIN_ACQ_FUND'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (7, (SELECT id FROM permission.perm_list WHERE code = 'ADMIN_FUND'), 1, false);
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) VALUES (7, (SELECT id FROM permission.perm_list WHERE code = 'ADMIN_CURRENCY_TYPE'), 1, false);

-- Ability to import a record with a different TCN
INSERT INTO permission.perm_list (code, description) VALUES ('ALLOW_ALT_TCN', 'Allows staff to import a record using an alternate TCN to avoid conflicts');

-- Ability to merge users
INSERT INTO permission.perm_list (code, description) VALUES ('MERGE_USERS', 'Allows user records to be merged');

-- Give circulation staff the ability to handle day-to-day booking/reservation tasks
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 5, id, 2, false FROM permission.perm_list WHERE code = 'ADMIN_BOOKING_RESERVATION';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 5, id, 2, false FROM permission.perm_list WHERE code = 'RETRIEVE_RESERVATION_PULL_LIST';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 5, id, 2, false FROM permission.perm_list WHERE code = 'CAPTURE_RESERVATION';

-- Give local administrators the ability to handle all booking/reservation tasks
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'ADMIN_BOOKING_RESOURCE';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'ADMIN_BOOKING_RESOURCE_TYPE';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'ADMIN_BOOKING_RESOURCE_ATTR';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'ADMIN_BOOKING_RESOURCE_ATTR_MAP';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'ADMIN_BOOKING_RESOURCE_ATTR_VALUE';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'ADMIN_BOOKING_RESERVATION';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'ADMIN_BOOKING_RESERVATION_ATTR_VALUE_MAP';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'HOLD_ITEM_CHECKED_OUT.override';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'RETRIEVE_RESERVATION_PULL_LIST';
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable) SELECT 10, id,  2, false FROM permission.perm_list WHERE code = 'CAPTURE_RESERVATION';

-- Trigger event definition permissions
INSERT INTO permission.perm_list (code, description) VALUES ('ADMIN_TRIGGER_EVENT_DEF', 'Allow a user to administer trigger event definitions');
INSERT INTO permission.perm_list (code, description) VALUES ('ADMIN_TRIGGER_CLEANUP', 'Allow a user to create, delete, and update trigger cleanup entries');
INSERT INTO permission.perm_list (code, description) VALUES ('CREATE_TRIGGER_CLEANUP', 'Allow a user to create trigger cleanup entries');
INSERT INTO permission.perm_list (code, description) VALUES ('DELETE_TRIGGER_CLEANUP', 'Allow a user to delete trigger cleanup entries');
INSERT INTO permission.perm_list (code, description) VALUES ('UPDATE_TRIGGER_CLEANUP', 'Allow a user to update trigger cleanup entries');
INSERT INTO permission.perm_list (code, description) VALUES ('CREATE_TRIGGER_EVENT_DEF', 'Allow a user to create trigger event definitions');
INSERT INTO permission.perm_list (code, description) VALUES ('DELETE_TRIGGER_EVENT_DEF', 'Allow a user to delete trigger event definitions');
INSERT INTO permission.perm_list (code, description) VALUES ('UPDATE_TRIGGER_EVENT_DEF', 'Allow a user to update trigger event definitions');
INSERT INTO permission.perm_list (code, description) VALUES ('VIEW_TRIGGER_EVENT_DEF', 'Allow a user to view trigger event definitions');
INSERT INTO permission.perm_list (code, description) VALUES ('ADMIN_TRIGGER_HOOK', 'Allow a user to create, update, and delete trigger hooks');
INSERT INTO permission.perm_list (code, description) VALUES ('CREATE_TRIGGER_HOOK', 'Allow a user to create trigger hooks');
INSERT INTO permission.perm_list (code, description) VALUES ('DELETE_TRIGGER_HOOK', 'Allow a user to delete trigger hooks');
INSERT INTO permission.perm_list (code, description) VALUES ('UPDATE_TRIGGER_HOOK', 'Allow a user to update trigger hooks');
INSERT INTO permission.perm_list (code, description) VALUES ('ADMIN_TRIGGER_REACTOR', 'Allow a user to create, update, and delete trigger reactors');
INSERT INTO permission.perm_list (code, description) VALUES ('CREATE_TRIGGER_REACTOR', 'Allow a user to create trigger reactors');
INSERT INTO permission.perm_list (code, description) VALUES ('DELETE_TRIGGER_REACTOR', 'Allow a user to delete trigger reactors');
INSERT INTO permission.perm_list (code, description) VALUES ('UPDATE_TRIGGER_REACTOR', 'Allow a user to update trigger reactors');
INSERT INTO permission.perm_list (code, description) VALUES ('ADMIN_TRIGGER_TEMPLATE_OUTPUT', 'Allow a user to delete trigger template output');
INSERT INTO permission.perm_list (code, description) VALUES ('DELETE_TRIGGER_TEMPLATE_OUTPUT', 'Allow a user to delete trigger template output');
INSERT INTO permission.perm_list (code, description) VALUES ('ADMIN_TRIGGER_VALIDATOR', 'Allow a user to create, update, and delete trigger validators');
INSERT INTO permission.perm_list (code, description) VALUES ('CREATE_TRIGGER_VALIDATOR', 'Allow a user to create trigger validators');
INSERT INTO permission.perm_list (code, description) VALUES ('DELETE_TRIGGER_VALIDATOR', 'Allow a user to delete trigger validators');
INSERT INTO permission.perm_list (code, description) VALUES ('UPDATE_TRIGGER_VALIDATOR', 'Allow a user to update trigger validators');

-- Add trigger administration permissions to the Local System Administrator group
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
    SELECT 10, id, 1, false FROM permission.perm_list
        WHERE code LIKE 'ADMIN_TRIGGER%'
            OR code LIKE 'CREATE_TRIGGER%'
            OR code LIKE 'DELETE_TRIGGER%'
            OR code LIKE 'UPDATE_TRIGGER%'
;
-- View trigger permissions are required at a consortial level for initial setup
INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
    SELECT 10, id, 0, false FROM permission.perm_list WHERE code LIKE 'VIEW_TRIGGER%';

-- Admin user account
INSERT INTO actor.usr ( profile, card, usrname, passwd, first_given_name, family_name, dob, master_account, super_user, ident_type, ident_value, home_ou ) VALUES ( 1, 1, 'admin', 'open-ils', 'Administrator', 'System Account', '1979-01-22', TRUE, TRUE, 1, 'identification', 1 );

-- Admin user barcode
INSERT INTO actor.card (usr, barcode) VALUES (1,'101010101010101');
UPDATE actor.usr SET card = (SELECT id FROM actor.card WHERE barcode = '101010101010101') WHERE id = 1;

-- Admin user permissions
INSERT INTO permission.usr_perm_map (usr,perm,depth) VALUES (1,-1,0);

-- Set a work_ou for the Administrator user
INSERT INTO permission.usr_work_ou_map (usr, work_ou) VALUES (1, 1);

--010.schema.biblio.sql:
INSERT INTO biblio.record_entry VALUES (-1,1,1,1,-1,NOW(),NOW(),FALSE,FALSE,'','AUTOGEN','-1','','FOO');

--040.schema.asset.sql:
INSERT INTO asset.copy_location (id, name,owning_lib) VALUES (1, oils_i18n_gettext(1, 'Stacks', 'acpl', 'name'),1);
SELECT SETVAL('asset.copy_location_id_seq'::TEXT, 100);

INSERT INTO asset.call_number VALUES (-1,1,NOW(),1,NOW(),-1,1,'UNCATALOGED');

-- some more from 002.schema.config.sql:
INSERT INTO config.xml_transform VALUES ( 'marcxml', 'http://www.loc.gov/MARC21/slim', 'marc', '---' );
INSERT INTO config.xml_transform VALUES ( 'mods', 'http://www.loc.gov/mods/', 'mods', '');
INSERT INTO config.xml_transform VALUES ( 'mods3', 'http://www.loc.gov/mods/v3', 'mods3', '');
INSERT INTO config.xml_transform VALUES ( 'mods32', 'http://www.loc.gov/mods/v3', 'mods32', '');
INSERT INTO config.xml_transform VALUES ( 'mods33', 'http://www.loc.gov/mods/v3', 'mods33', '');

-- circ matrix
INSERT INTO config.circ_matrix_matchpoint (org_unit,grp,duration_rule,recurring_fine_rule,max_fine_rule) VALUES (1,1,11,1,1);


-- hold matrix - 110.hold_matrix.sql:
INSERT INTO config.hold_matrix_matchpoint (requestor_grp) VALUES (1);

-- Staged Search (for default matchpoints)
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(1, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(1, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(2, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(2, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(2, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(3, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(3, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(3, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(4, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(4, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(4, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(5, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(5, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(5, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(6, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(6, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(6, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(7, 'first_word', 1.5);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(8, 'first_word', 1.5);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(9, 'first_word', 1.5);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(10, 'first_word', 1.5);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(15, 'word_order', 10);

-- Vandelay (for importing and exporting records) 012.schema.vandelay.sql 
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (1, 'title', oils_i18n_gettext(1, 'Title of work', 'vqbrad', 'description'),'//*[@tag="245"]/*[contains("abcmnopr",@code)]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (2, 'author', oils_i18n_gettext(2, 'Author of work', 'vqbrad', 'description'),'//*[@tag="100" or @tag="110" or @tag="113"]/*[contains("ad",@code)]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (3, 'language', oils_i18n_gettext(3, 'Language of work', 'vqbrad', 'description'),'//*[@tag="240"]/*[@code="l"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (4, 'pagination', oils_i18n_gettext(4, 'Pagination', 'vqbrad', 'description'),'//*[@tag="300"]/*[@code="a"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, ident, remove ) VALUES (5, 'isbn',oils_i18n_gettext(5, 'ISBN', 'vqbrad', 'description'),'//*[@tag="020"]/*[@code="a"]', TRUE, $r$(?:-|\s.+$)$r$);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, ident, remove ) VALUES (6, 'issn',oils_i18n_gettext(6, 'ISSN', 'vqbrad', 'description'),'//*[@tag="022"]/*[@code="a"]', TRUE, $r$(?:-|\s.+$)$r$);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (7, 'price',oils_i18n_gettext(7, 'Price', 'vqbrad', 'description'),'//*[@tag="020" or @tag="022"]/*[@code="c"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, ident ) VALUES (8, 'rec_identifier',oils_i18n_gettext(8, 'Accession Number', 'vqbrad', 'description'),'//*[@tag="001"]', TRUE);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, ident ) VALUES (9, 'eg_tcn',oils_i18n_gettext(9, 'TCN Value', 'vqbrad', 'description'),'//*[@tag="901"]/*[@code="a"]', TRUE);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, ident ) VALUES (10, 'eg_tcn_source',oils_i18n_gettext(10, 'TCN Source', 'vqbrad', 'description'),'//*[@tag="901"]/*[@code="b"]', TRUE);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, ident ) VALUES (11, 'eg_identifier',oils_i18n_gettext(11, 'Internal ID', 'vqbrad', 'description'),'//*[@tag="901"]/*[@code="c"]', TRUE);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (12, 'publisher',oils_i18n_gettext(12, 'Publisher', 'vqbrad', 'description'),'//*[@tag="260"]/*[@code="b"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, remove ) VALUES (13, 'pubdate',oils_i18n_gettext(13, 'Publication Date', 'vqbrad', 'description'),'//*[@tag="260"]/*[@code="c"][1]',$r$\D$r$);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (14, 'edition',oils_i18n_gettext(14, 'Edition', 'vqbrad', 'description'),'//*[@tag="250"]/*[@code="a"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (15, 'item_barcode',oils_i18n_gettext(15, 'Item Barcode', 'vqbrad', 'description'),'//*[@tag="852p"]/*[@code="a"][1]');
SELECT SETVAL('vandelay.bib_attr_definition_id_seq'::TEXT, 100);

INSERT INTO vandelay.import_item_attr_definition (
    owner, name, tag, owning_lib, circ_lib, location,
    call_number, circ_modifier, barcode, price, copy_number,
    circulate, ref, holdable, opac_visible, status
) VALUES (
    1,
    'Evergreen 852 export format',
    '852',
    '[@code = "b"][1]',
    '[@code = "b"][2]',
    'c',
    'j',
    'g',
    'p',
    'y',
    't',
    '[@code = "x" and text() = "circulating"]',
    '[@code = "x" and text() = "reference"]',
    '[@code = "x" and text() = "holdable"]',
    '[@code = "x" and text() = "visible"]',
    'z'
);

INSERT INTO vandelay.import_item_attr_definition (
    owner,
    name,
    tag,
    owning_lib,
    location,
    call_number,
    circ_modifier,
    barcode,
    price,
    status
) VALUES (
    1,
    'Unicorn Import format -- 999',
    '999',
    'm',
    'l',
    'a',
    't',
    'i',
    'p',
    'k'
);

INSERT INTO vandelay.authority_attr_definition (id, code, description, xpath, ident ) VALUES (1, 'rec_identifier',oils_i18n_gettext(1, 'Identifier', 'vqarad', 'description'),'//*[@tag="001"]', TRUE);
SELECT SETVAL('vandelay.authority_attr_definition_id_seq'::TEXT, 100);


INSERT INTO container.copy_bucket_type (code,label) VALUES ('misc', oils_i18n_gettext('misc', 'Miscellaneous', 'ccpbt', 'label'));
INSERT INTO container.copy_bucket_type (code,label) VALUES ('staff_client', oils_i18n_gettext('staff_client', 'General Staff Client container', 'ccpbt', 'label'));
INSERT INTO container.call_number_bucket_type (code,label) VALUES ('misc', oils_i18n_gettext('misc', 'Miscellaneous', 'ccnbt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('misc', oils_i18n_gettext('misc', 'Miscellaneous', 'cbrebt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('staff_client', oils_i18n_gettext('staff_client', 'General Staff Client container', 'cbrebt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('bookbag', oils_i18n_gettext('bookbag', 'Book Bag', 'cbrebt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('reading_list', oils_i18n_gettext('reading_list', 'Reading List', 'cbrebt', 'label'));

INSERT INTO container.user_bucket_type (code,label) VALUES ('misc', oils_i18n_gettext('misc', 'Miscellaneous', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks', oils_i18n_gettext('folks', 'Friends', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:pub_book_bags.view', oils_i18n_gettext('folks:pub_book_bags.view', 'List Published Book Bags', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:pub_book_bags.add', oils_i18n_gettext('folks:pub_book_bags.add', 'Add to Published Book Bags', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:circ.view', oils_i18n_gettext('folks:circ.view', 'View Circulations', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:circ.renew', oils_i18n_gettext('folks:circ.renew', 'Renew Circulations', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:circ.checkout', oils_i18n_gettext('folks:circ.checkout', 'Checkout Items', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:hold.view', oils_i18n_gettext('folks:hold.view', 'View Holds', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:hold.cancel', oils_i18n_gettext('folks:hold.cancel', 'Cancel Holds', 'cubt', 'label'));


-- Trigger Event Definitions -------------------------------------------------

-- Sample Overdue Notice --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, delay_field, group_field, template) 
    VALUES (1, 'f', 1, '7 Day Overdue Email Notification', 'checkout.due', 'CircIsOverdue', 'SendEmail', '7 days', 'due_date', 'usr', 
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Subject: Overdue Notification

Dear [% user.family_name %], [% user.first_given_name %]
Our records indicate the following items are overdue.

[% FOR circ IN target %]
    Title: [% circ.target_copy.call_number.record.simple_record.title %] 
    Barcode: [% circ.target_copy.barcode %] 
    Due: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
    Item Cost: [% helpers.get_copy_price(circ.target_copy) %]
    Total Owed For Transaction: [% circ.billable_transaction.summary.total_owed %]
    Library: [% circ.circ_lib.name %]
[% END %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES 
    (1, 'target_copy.call_number.record.simple_record'),
    (1, 'usr'),
    (1, 'billable_transaction.summary'),
    (1, 'circ_lib.billing_address');
  

-- Sample Mark Long-Overdue Item Lost --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, delay_field) 
    VALUES (2, 'f', 1, '90 Day Overdue Mark Lost', 'checkout.due', 'CircIsOverdue', 'MarkItemLost', '90 days', 'due_date');

-- Sample Auto Mark Lost Notice --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, group_field, template) 
    VALUES (3, 'f', 1, '90 Day Overdue Mark Lost Notice', 'lost.auto', 'NOOP_True', 'SendEmail', 'usr',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Subject: Overdue Items Marked Lost

Dear [% user.family_name %], [% user.first_given_name %]
The following items are 90 days overdue and have been marked LOST.

[% FOR circ IN target %]
    Title: [% circ.target_copy.call_number.record.simple_record.title %] 
    Barcode: [% circ.target_copy.barcode %] 
    Due: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
    Item Cost: [% helpers.get_copy_price(circ.target_copy) %]
    Total Owed For Transaction: [% circ.billable_transaction.summary.total_owed %]
    Library: [% circ.circ_lib.name %]
[% END %]

$$);


INSERT INTO action_trigger.environment (event_def, path) VALUES 
    (3, 'target_copy.call_number.record.simple_record'),
    (3, 'usr'),
    (3, 'billable_transaction.summary'),
    (3, 'circ_lib.billing_address');

-- Sample Purchase Order HTML Template --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, template) 
    VALUES (4, 't', 1, 'PO HTML', 'format.po.html', 'NOOP_True', 'ProcessTemplate', 
$$
[%- USE date -%]
[%-
    # find a lineitem attribute by name and optional type
    BLOCK get_li_attr;
        FOR attr IN li.attributes;
            IF attr.attr_name == attr_name;
                IF !attr_type OR attr_type == attr.attr_type;
                    attr.attr_value;
                    LAST;
                END;
            END;
        END;
    END
-%]

<h2>Purchase Order [% target.id %]</h2>
<br/>
date <b>[% date.format(date.now, '%Y%m%d') %]</b>
<br/>

<style>
    table td { padding:5px; border:1px solid #aaa;}
    table { width:95%; border-collapse:collapse; }
</style>
<table id='vendor-table'>
  <tr>
    <td valign='top'>Vendor</td>
    <td>
      <div>[% target.provider.name %]</div>
      <div>[% target.provider.addresses.0.street1 %]</div>
      <div>[% target.provider.addresses.0.street2 %]</div>
      <div>[% target.provider.addresses.0.city %]</div>
      <div>[% target.provider.addresses.0.state %]</div>
      <div>[% target.provider.addresses.0.country %]</div>
      <div>[% target.provider.addresses.0.post_code %]</div>
    </td>
    <td valign='top'>Ship to / Bill to</td>
    <td>
      <div>[% target.ordering_agency.name %]</div>
      <div>[% target.ordering_agency.billing_address.street1 %]</div>
      <div>[% target.ordering_agency.billing_address.street2 %]</div>
      <div>[% target.ordering_agency.billing_address.city %]</div>
      <div>[% target.ordering_agency.billing_address.state %]</div>
      <div>[% target.ordering_agency.billing_address.country %]</div>
      <div>[% target.ordering_agency.billing_address.post_code %]</div>
    </td>
  </tr>
</table>

<br/><br/><br/>

<table>
  <thead>
    <tr>
      <th>PO#</th>
      <th>ISBN or Item #</th>
      <th>Title</th>
      <th>Quantity</th>
      <th>Unit Price</th>
      <th>Line Total</th>
    </tr>
  </thead>
  <tbody>

  [% subtotal = 0 %]
  [% FOR li IN target.lineitems %]

  <tr>
    [% count = li.lineitem_details.size %]
    [% price = PROCESS get_li_attr attr_name = 'estimated_price' %]
    [% litotal = (price * count) %]
    [% subtotal = subtotal + litotal %]
    [% isbn = PROCESS get_li_attr attr_name = 'isbn' %]
    [% ident = PROCESS get_li_attr attr_name = 'identifier' %]

    <td>[% target.id %]</td>
    <td>[% isbn || ident %]</td>
    <td>[% PROCESS get_li_attr attr_name = 'title' %]</td>
    <td>[% count %]</td>
    <td>[% price %]</td>
    <td>[% litotal %]</td>
  </tr>
  [% END %]
  <tr>
    <td/><td/><td/><td/>
    <td>Sub Total</td>
    <td>[% subtotal %]</td>
  </tr>
  </tbody>
</table>

<br/>

Total Line Item Count: [% target.lineitems.size %]
$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES 
    (4, 'lineitems.lineitem_details.fund'),
    (4, 'lineitems.lineitem_details.location'),
    (4, 'lineitems.lineitem_details.owning_lib'),
    (4, 'ordering_agency.mailing_address'),
    (4, 'ordering_agency.billing_address'),
    (4, 'provider.addresses'),
    (4, 'lineitems.attributes');


INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, delay_field, group_field, template)
    VALUES (5, 'f', 1, 'Hold Ready for Pickup Email Notification', 'hold.available', 'HoldIsAvailable', 'SendEmail', '30 minutes', 'shelf_time', 'usr',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Subject: Hold Available Notification

Dear [% user.family_name %], [% user.first_given_name %]
The item(s) you requested are available for pickup from the Library.

[% FOR hold IN target %]
    Title: [% hold.current_copy.call_number.record.simple_record.title %]
    Author: [% hold.current_copy.call_number.record.simple_record.author %]
    Call Number: [% hold.current_copy.call_number.label %]
    Barcode: [% hold.current_copy.barcode %]
    Library: [% hold.pickup_lib.name %]
[% END %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (5, 'current_copy.call_number.record.simple_record'),
    (5, 'usr'),
    (5, 'pickup_lib.billing_address');

INSERT INTO action_trigger.hook (key,core_type,description) VALUES ('password.reset_request','aupr','Patron has requested a self-serve password reset');
INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, template) 
    VALUES (15, 'f', 1, 'Password reset request notification', 'password.reset_request', 'NOOP_True', 'SendEmail', '00:00:01',
$$
[%- USE date -%]
[%- user = target.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || user.home_ou.email || default_sender %]
Subject: [% user.home_ou.name %]: library account password reset request

You have received this message because you, or somebody else, requested a reset
of your library system password. If you did not request a reset of your library
system password, just ignore this message and your current password will
continue to work.

If you did request a reset of your library system password, please perform
the following steps to continue the process of resetting your password:

1. Open the following link in a web browser: https://[% params.hostname %]/opac/password/[% params.locale || 'en-US' %]/[% target.uuid %]
The browser displays a password reset form.

2. Enter your new password in the password reset form in the browser. You must
enter the password twice to ensure that you do not make a mistake. If the
passwords match, you will then be able to log in to your library system account
with the new password.

$$);
INSERT INTO action_trigger.environment ( event_def, path) VALUES
    ( 15, 'usr' );
INSERT INTO action_trigger.environment ( event_def, path) VALUES
    ( 15, 'usr.home_ou' );

SELECT SETVAL('action_trigger.event_definition_id_seq'::TEXT, 100);

-- Create seed data for the asset.uri table
INSERT INTO asset.uri (id, href, active) VALUES (-1, 'http://example.com/fake', FALSE);
