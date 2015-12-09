-- Table SENTRY_GM_PRIVILEGE for classes [org.apache.sentry.provider.db.service.model.MSentryGMPrivilege]
CREATE TABLE `SENTRY_GM_PRIVILEGE`
(
    `GM_PRIVILEGE_ID` BIGINT NOT NULL,
    `ACTION` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `COMPONENT_NAME` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `CREATE_TIME` BIGINT NOT NULL,
    `WITH_GRANT_OPTION` CHAR(1) NOT NULL DEFAULT 'N',
    `RESOURCE_NAME_0` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
    `RESOURCE_NAME_1` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
    `RESOURCE_NAME_2` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
    `RESOURCE_NAME_3` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
    `RESOURCE_TYPE_0` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
    `RESOURCE_TYPE_1` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
    `RESOURCE_TYPE_2` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
    `RESOURCE_TYPE_3` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
    `SCOPE` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `SERVICE_NAME` VARCHAR(64) BINARY CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE `SENTRY_GM_PRIVILEGE`
  ADD CONSTRAINT `SENTRY_GM_PRIVILEGE_PK` PRIMARY KEY (`GM_PRIVILEGE_ID`);
-- Constraints for table SENTRY_GM_PRIVILEGE for class(es) [org.apache.sentry.provider.db.service.model.MSentryGMPrivilege]
ALTER TABLE `SENTRY_GM_PRIVILEGE`
  ADD UNIQUE `GM_PRIVILEGE_UNIQUE` (`COMPONENT_NAME`,`SERVICE_NAME`,`RESOURCE_NAME_0`,`RESOURCE_TYPE_0`,`RESOURCE_NAME_1`,`RESOURCE_TYPE_1`,`RESOURCE_NAME_2`,`RESOURCE_TYPE_2`,`RESOURCE_NAME_3`,`RESOURCE_TYPE_3`,`ACTION`,`WITH_GRANT_OPTION`);

ALTER TABLE `SENTRY_GM_PRIVILEGE`
  ADD INDEX `SENTRY_GM_PRIV_COMP_IDX` (`COMPONENT_NAME`);

ALTER TABLE `SENTRY_GM_PRIVILEGE`
  ADD INDEX `SENTRY_GM_PRIV_SERV_IDX` (`SERVICE_NAME`);

ALTER TABLE `SENTRY_GM_PRIVILEGE`
  ADD INDEX `SENTRY_GM_PRIV_RES0_IDX` (`RESOURCE_NAME_0`,`RESOURCE_TYPE_0`);

ALTER TABLE `SENTRY_GM_PRIVILEGE`
  ADD INDEX `SENTRY_GM_PRIV_RES1_IDX` (`RESOURCE_NAME_1`,`RESOURCE_TYPE_1`);

ALTER TABLE `SENTRY_GM_PRIVILEGE`
  ADD INDEX `SENTRY_GM_PRIV_RES2_IDX` (`RESOURCE_NAME_2`,`RESOURCE_TYPE_2`);

ALTER TABLE `SENTRY_GM_PRIVILEGE`
  ADD INDEX `SENTRY_GM_PRIV_RES3_IDX` (`RESOURCE_NAME_3`,`RESOURCE_TYPE_3`);

-- Table SENTRY_ROLE_GM_PRIVILEGE_MAP for join relationship
CREATE TABLE `SENTRY_ROLE_GM_PRIVILEGE_MAP`
(
    `ROLE_ID` BIGINT NOT NULL,
    `GM_PRIVILEGE_ID` BIGINT NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE `SENTRY_ROLE_GM_PRIVILEGE_MAP`
  ADD CONSTRAINT `SENTRY_ROLE_GM_PRIVILEGE_MAP_PK` PRIMARY KEY (`ROLE_ID`,`GM_PRIVILEGE_ID`);

-- Constraints for table SENTRY_ROLE_GM_PRIVILEGE_MAP
ALTER TABLE `SENTRY_ROLE_GM_PRIVILEGE_MAP`
  ADD CONSTRAINT `SEN_RLE_GM_PRV_MAP_SN_RLE_FK`
  FOREIGN KEY (`ROLE_ID`) REFERENCES `SENTRY_ROLE`(`ROLE_ID`);

ALTER TABLE `SENTRY_ROLE_GM_PRIVILEGE_MAP`
  ADD CONSTRAINT `SEN_RL_GM_PRV_MAP_SN_DB_PRV_FK`
  FOREIGN KEY (`GM_PRIVILEGE_ID`) REFERENCES `SENTRY_GM_PRIVILEGE`(`GM_PRIVILEGE_ID`);
