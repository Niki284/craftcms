/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS addresses;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ghrxsjrrvfpfepllsvbyalweebdsjrpbumno` (`ownerId`),
  CONSTRAINT `fk_ghrxsjrrvfpfepllsvbyalweebdsjrpbumno` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ieahdykyntfagwqpyzhasmrgcohcshkuvpio` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS announcements;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bpbgauegvaajuilweomshrzyahsodgmhdapd` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_forcumardujnlmnragjwogpstcfiwtrwmswp` (`dateRead`),
  KEY `fk_kxqnwcegeanwfkgwrxdtmmfasyuqbkvstfqm` (`pluginId`),
  CONSTRAINT `fk_kxqnwcegeanwfkgwrxdtmmfasyuqbkvstfqm` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_thfulztnelirxtaaidpmzidhgordjyluaele` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS assetindexdata;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_herbfetxbmujhbeltnqekclakzclwefhkbph` (`sessionId`,`volumeId`),
  KEY `idx_cpszvfsbwtbwuhqlvayxtbiejwfuhddjaurt` (`volumeId`),
  CONSTRAINT `fk_addjncftjmshtpjvfwmwtvcwgyiiazopumto` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_agiuesnkkwziiojdccrsgbfcnvbmcliaggko` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS assetindexingsessions;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS assets;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_chibwbkemlotgpadhhnokpkbtfaecsbgbroa` (`filename`,`folderId`),
  KEY `idx_bawubvggeaciwoyuhvrcfvfuysvhbbxqyyqd` (`folderId`),
  KEY `idx_beisuazodwmhdfchauqjajylfvtpfugrxrfg` (`volumeId`),
  KEY `fk_upwlgfpjpzzcdmjksbosbrpizmfunvkhkzpx` (`uploaderId`),
  CONSTRAINT `fk_jqhyvcalydawkpskdqlxahcvjspdgnirsslo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kefalxuqivwocuzwkiywwmjdievvqmfetlke` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pbhczpvnqhbudntkkzgvfghfyckudkkggejb` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_upwlgfpjpzzcdmjksbosbrpizmfunvkhkzpx` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS categories;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uhdskgptdynisokqrifgdaaqofqsaixhhlfp` (`groupId`),
  KEY `fk_snrhnlrexuhwjdokmvuvtfkzubmoorpgzyyj` (`parentId`),
  CONSTRAINT `fk_lziwiplblrhjwnjmmszyyzrzopnyfvjdglgy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rowrrkmnooazefzulelbsfhoksegnojbofge` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_snrhnlrexuhwjdokmvuvtfkzubmoorpgzyyj` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS categorygroups;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tudephngcuviugslaninplkfrudcrzdcqdjw` (`name`),
  KEY `idx_yfczggzzirxjfbzbwdkibddsejesmsjbuxah` (`handle`),
  KEY `idx_tyctgxftfrpjgunkgiviohikttqizwyjxguq` (`structureId`),
  KEY `idx_cozudeifwgtgmfyndpdguwbeyyuqetcxnovl` (`fieldLayoutId`),
  KEY `idx_tvsqkzwvktqrvsluxkdjltbilnkbnpqeoqiq` (`dateDeleted`),
  CONSTRAINT `fk_jrvqjtgqsuroxyecbihxybihjibxiivlwegt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oitpcrgqzscuppwcaqldczfocfndgftavaqu` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS categorygroups_sites;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tlguxaifkghbasjzaegksuduuiurorjqyzgn` (`groupId`,`siteId`),
  KEY `idx_ihatymvolbmceyknmstxwpffkfesjxblvjyc` (`siteId`),
  CONSTRAINT `fk_fkuqwizhexdhpvmkkqpjtturylsdbbuxickg` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_spymvapnqmvuqjgayzonmxcaendsgdunyoqi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS changedattributes;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_xaxrucqscklwtnxumfebwwamrriaibrvcjni` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jbhrpuasoudomoeigujnocosajwjhacrprql` (`siteId`),
  KEY `fk_sqateelfijcdyqacmwrpxsqplckhqodsixwt` (`userId`),
  CONSTRAINT `fk_jbhrpuasoudomoeigujnocosajwjhacrprql` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_racmgxiomajiwjfakxdogklivlnfkioljkpu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sqateelfijcdyqacmwrpxsqplckhqodsixwt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS changedfields;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_qeykfzipcvretpsighqyzffsvmvpuwcdwuin` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_zxlmvatxwzhdjhbsvkpdhmjksygdrivqvieu` (`siteId`),
  KEY `fk_qyzhvgwdniakqqdhfcobpcbvvwkxwelybemx` (`fieldId`),
  KEY `fk_tedewdzyhlreqwcwgyeiidgiiewbydemqjgu` (`userId`),
  CONSTRAINT `fk_bvzdojubktwfszrwsefjybxroroduzoulosr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qyzhvgwdniakqqdhfcobpcbvvwkxwelybemx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tedewdzyhlreqwcwgyeiidgiiewbydemqjgu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_zxlmvatxwzhdjhbsvkpdhmjksygdrivqvieu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS content;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body_ivhuqfnz` text,
  `field_price_qjselyjq` int DEFAULT NULL,
  `field_description_wncjpcso` text,
  `field_relatedproducts_wrirorpm` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jitzevssotbkrokjbafjcjvakeenubijrizi` (`elementId`,`siteId`),
  KEY `idx_hntxzwmxttzrduyixqxoqazhiqkfvdyieegl` (`siteId`),
  KEY `idx_ufyggghojciyisyodgwvilzmtaqypzmlfaam` (`title`),
  CONSTRAINT `fk_xebihdxnnbpkvugzgdlrcsupjxeybgsjwuhv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xgdyxojqrmavorwzcdspnytiwwipmtzbpwoy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS craftidtokens;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_jvucsbywdhlopwhrcipahpnykhuyxuauezjx` (`userId`),
  CONSTRAINT `fk_jvucsbywdhlopwhrcipahpnykhuyxuauezjx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS deprecationerrors;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dgontdlskytebwkyqpnwdastugdfwoddlerm` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS drafts;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_lmskhqveasmaqoactkmxwwznkvztuchnllmg` (`creatorId`,`provisional`),
  KEY `idx_pitanuofjxpsdmlaachiyolctbmqvulgpxda` (`saved`),
  KEY `fk_dtxeueahrwwbnwsyplqnbdqchkhjctmdgnqr` (`canonicalId`),
  CONSTRAINT `fk_dtxeueahrwwbnwsyplqnbdqchkhjctmdgnqr` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nnfgktgbwvlawqvjhlnzqnhiylcavxiaecur` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS elementactivity;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_dlkpddcdhysjisbwklmxtklrmtryjazptafp` (`elementId`,`timestamp`,`userId`),
  KEY `fk_egdfizvzmvbbgdtlkqwpsmsfsmiinjggtpvg` (`userId`),
  KEY `fk_oorxgvgdnuswuwajzlzquhlsoilbzcoxaiqc` (`siteId`),
  KEY `fk_dtmllbyamxvjppqzjyngqxkuqpgbxoonvcmy` (`draftId`),
  CONSTRAINT `fk_dtmllbyamxvjppqzjyngqxkuqpgbxoonvcmy` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_egdfizvzmvbbgdtlkqwpsmsfsmiinjggtpvg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eiwgljxtpdptzvujgqajxjuqwlsfdedslpnu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oorxgvgdnuswuwajzlzquhlsoilbzcoxaiqc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS elements;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cdexlvssvfmvwkzeltietyfcxgxwldirmitj` (`dateDeleted`),
  KEY `idx_gvemjhtfzdoxoehnokumgqhxlrzcsgykieba` (`fieldLayoutId`),
  KEY `idx_vibmlcaustnswigxigohufocgeovjgxkyyrn` (`type`),
  KEY `idx_atpdmrfvkepdupdqubewwqlibkijyznuezyc` (`enabled`),
  KEY `idx_nqquixxjczvwrazlleqyzwyjdjwkwhuvrftx` (`canonicalId`),
  KEY `idx_iybinnlyaydyavezcdqnahhsbtcelmwlholo` (`archived`,`dateCreated`),
  KEY `idx_pdcqnbrxglvhieaihvcaxwaeikyxhwbxydvw` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_hgrgwdvdiacjyybocgitcvwtfddlaszuxrod` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_uwurttzgxguzmtotbggdybpqnrlqlrwbtcbd` (`draftId`),
  KEY `fk_hslhljiqfnmzwlizeliyomztgjkohzzwplkj` (`revisionId`),
  CONSTRAINT `fk_hslhljiqfnmzwlizeliyomztgjkohzzwplkj` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qavqdtxcdoiqaymvdmmpzhnkwymlbdfpejea` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uwurttzgxguzmtotbggdybpqnrlqlrwbtcbd` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xtjzjsgeremdrwetzolevptbwiiybxquxziz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS elements_sites;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fjryzraeavifljttkkwmpsoiwwokogksnpes` (`elementId`,`siteId`),
  KEY `idx_uxqzysanudqzwomwskozivskkivxqjadduxg` (`siteId`),
  KEY `idx_nzrrkgfxyhobafwvovqykhsknvycionliyfu` (`slug`,`siteId`),
  KEY `idx_ogzlubbzplnnsrvrjfaaogwxxhueumfakljn` (`enabled`),
  KEY `idx_imiertwexwdkvyrntxgfiqbapetdiifvehjc` (`uri`,`siteId`),
  CONSTRAINT `fk_pgtixxgntbpzvlhullmghykgzeklvldikavu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yiehzrjptavqnsyviwgqxhpdjnxjvhkahzax` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS entries;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dkurduidufeaqiwchiqvrcimdtbumzaptyug` (`postDate`),
  KEY `idx_dsoxtvfixkrhbchoplyhauydmtvuhdbboxqa` (`expiryDate`),
  KEY `idx_aqjbmvugljjdgeahtkhjeqqdoahmfdclxxqq` (`authorId`),
  KEY `idx_ffxrkhjwgdrfmjvvlocrfhhzzqeufdjhgufz` (`sectionId`),
  KEY `idx_krbyfsaeuvpskoltxtkztbpjpbjylprpphcy` (`typeId`),
  KEY `fk_zhfaliipwzntxzlhjqyvfnwqhypvhonexlkg` (`parentId`),
  CONSTRAINT `fk_rxiywycccikekkcluklqhpfmgqdwdlobthwp` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tknebberhffpwlqxfnjtsendpttrcmicizzo` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vbdocaukjoyibaykihscldqidadqmrrzzizv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vlgxcljlbeuyoofwgluybldjpllehqhzupkr` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zhfaliipwzntxzlhjqyvfnwqhypvhonexlkg` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS entrytypes;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rwyljkbbzbkgrtgqudflvspyiilgwxuvmkfy` (`name`,`sectionId`),
  KEY `idx_tnglsnjxhxxnlnrbervxovcxgyivoasytilg` (`handle`,`sectionId`),
  KEY `idx_vysywbldelfgswflroelxuxmqxzfwfgounnn` (`sectionId`),
  KEY `idx_uypvmgovfrknwdfzzgyukberyvvuovlkfxsc` (`fieldLayoutId`),
  KEY `idx_tusxooshjyohhhbyxgmpsvunuesxmjqnnswk` (`dateDeleted`),
  CONSTRAINT `fk_hjpsdxrcibakbkzpygttlruywtdnpphwzpet` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_svhwxlncsyubrfsuyjonvptiqhbghehztvdq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS fieldgroups;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jvoasgnejavxcewfhryprcvoteaqnrjrwgrh` (`name`),
  KEY `idx_pamiqpkvnnikodpiadhiyaedmcceqfdatfqf` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS fieldlayoutfields;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dkvnztsxzeefykocwjvqjnbymemffsyohath` (`layoutId`,`fieldId`),
  KEY `idx_lychvggswgxnxlpbfeflsfskqsrkskkwibzm` (`sortOrder`),
  KEY `idx_jkbnnzulddsghvvxlzkfiitrldwdjhalsgdo` (`tabId`),
  KEY `idx_gwroxfrlrgsrugktsmfkhwuqsispbwumhlgi` (`fieldId`),
  CONSTRAINT `fk_fkymdfthcfmzgudnojiayjequtoxyaljdcoc` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iqjoeraodjesgttmkhwkrlxwehvtybaupuqo` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ivzsuglzrigrbvtureplexvlfphanmtdfpmj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS fieldlayouts;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uqreanwadacfctrqoagmhxmwvwrlxiuzuwxi` (`dateDeleted`),
  KEY `idx_bwszmqpbwkgxlhpjgcuiwqmhrhorzbghbyar` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS fieldlayouttabs;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gthyyhnzslzovvwhozlewcdvcwtbujziudju` (`sortOrder`),
  KEY `idx_dipgiexjstsdmgtrlcxrxyoutbutgijzzcdt` (`layoutId`),
  CONSTRAINT `fk_mkedunwhblcvliyehggopbwhmxrodqdapmtm` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS fields;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_trbsywshwwyxuoiqfayjjxxotrpdcbanjpsn` (`handle`,`context`),
  KEY `idx_neiznmxmnvpisodencgvuitnpbcfudyrpuwm` (`groupId`),
  KEY `idx_bpddjhpkqzmrnysdkmyzwpfkdtqktyosaxmx` (`context`),
  CONSTRAINT `fk_luzpwopjtpwxwlazaoishmzpxbmwrkzxnsgx` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS globalsets;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cvwnjrqnfnywqfidgjvxegelgsfbswxmunmx` (`name`),
  KEY `idx_jngwphaanyazzhbyypfhbvjsuzismilcavzf` (`handle`),
  KEY `idx_khkfwtmtmnqpvhkjcwtjgjraeethyxksortu` (`fieldLayoutId`),
  KEY `idx_kqnccnmfmrnxujafjcygzleugmzcdyxjivua` (`sortOrder`),
  CONSTRAINT `fk_ccnosiqfuwyzmrbibmnnjbceqvmqmkrczicc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gbsrmqwjmommyxrvytrwydsgxmpfklnspdxc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS gqlschemas;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS gqltokens;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mdpdgrhecxafjbtonejegpzkuqqzcofiyrew` (`accessToken`),
  UNIQUE KEY `idx_fbijqlbxbhxudsbsvbkmiidhrtxmubvnsjno` (`name`),
  KEY `fk_bhxbojsxhryocjppzixjmeskligoqzwqbwea` (`schemaId`),
  CONSTRAINT `fk_bhxbojsxhryocjppzixjmeskligoqzwqbwea` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS imagetransformindex;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ilkxllwwuxuosncevdyxxdbqgkbbumxhubvt` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS imagetransforms;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emhdhkqyzhvfszjggmkfasleeyawfumlealc` (`name`),
  KEY `idx_sfdcdjfvwmmpfvuxgkbuoemddptcavaiewig` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS info;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS matrixblocks;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rygodghulxiuzytwrwfnmmdfdriouzgvxwtx` (`primaryOwnerId`),
  KEY `idx_emybcmfgwbhvhqxwonwyldkwomdmodalkgws` (`fieldId`),
  KEY `idx_netndkelawiucgqradequncterqixijqbrwu` (`typeId`),
  CONSTRAINT `fk_foyrmvtcyovqkcxtrrgvfinqezsyxxeyiuup` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gakfknbrlzmmxnmykqaottdyencmdyozcahw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nlbdtzdnfhyvkpvycskmsupjrfdquewqjjae` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_paltdidmooihcajbcfefkcuwvnoetlhtxotb` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS matrixblocks_owners;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_dlsczgkzopkdivhqafiwkkhslxybcwoufebg` (`ownerId`),
  CONSTRAINT `fk_cmoabcrrwimrrzpdtgnyvbbgnofatbupjfzi` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dlsczgkzopkdivhqafiwkkhslxybcwoufebg` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS matrixblocktypes;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ljuvmidonszfnuqpwlwtpbctplighitmduav` (`name`,`fieldId`),
  KEY `idx_owkjdjuxvbjfbezutzvvdikxrofzcbnybvpc` (`handle`,`fieldId`),
  KEY `idx_eudmoygshzoygycjtcoyahjfdnauyowumjtm` (`fieldId`),
  KEY `idx_dctyuycwsuqlkcuyjfgfkygcittlhfvfzuow` (`fieldLayoutId`),
  CONSTRAINT `fk_cyaczcxcyzxwuemsdmegpzcvfysqkffbhubi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jbuqjwwnbooyvxvvmrrzdcxxaamlrezwyosj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS migrations;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ujfmtajlgrmpdmxlzvhskmgodfhtkzfsbxmi` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS plugins;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pkrlwzznvodwvztskqqrohgxvbgrckubbdzj` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS projectconfig;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS queue;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_kzlyvheorpubkimacxftucjgvjuxbyyxftnz` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_itpworjcejzsdmkjiprlasuvatxjqbifshky` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS relations;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hyesaddnohaopldxlvakqryelbmrtdyksefm` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_jtipuoffygoqjhqretioepazhgfzeiixutrq` (`sourceId`),
  KEY `idx_ldsaxobetfnzgwndukngmhwnznbqerzvtaxw` (`targetId`),
  KEY `idx_ppzepufhmhugwuwjalyxjmprtfxbsnafnvcu` (`sourceSiteId`),
  CONSTRAINT `fk_bhpfpfqbpkwzojfpwlvmyqljlvxzqqkbhhlk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rlxekzbcdlgdlecqplizaviinqusbctgsimo` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sllqrnkkbaalizobmeenbtyyicvclkrkakap` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS resourcepaths;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS revisions;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_giwbxzjxduiaxevyfqctbpxrbfyxbnuanjwk` (`canonicalId`,`num`),
  KEY `fk_kerwqovgdvawzbmigrwlpbjlfjqnqwydcxjm` (`creatorId`),
  CONSTRAINT `fk_hbxzhtfyseqohmedkmeuzxfsgrddhlrhzrwx` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kerwqovgdvawzbmigrwlpbjlfjqnqwydcxjm` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS searchindex;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_tfgjktyrewdkltlyaonofizirglpkevikdpe` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS sections;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_quhimsaesxllexeagqqctfmlvjlkcvfuhpkw` (`handle`),
  KEY `idx_jqfhwmkrztdeganvbmohbsykeptrayumfkhr` (`name`),
  KEY `idx_meylkydzehwvjfhdzlebbqurkkhdnasypynd` (`structureId`),
  KEY `idx_igjqwmvzqvxzxrzwfciricbzydbnhnymydyw` (`dateDeleted`),
  CONSTRAINT `fk_ffelvqxxqgdsyglqmncjkfdtrvfrdezrwaiq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS sections_sites;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fyauoswddarrnrcayvcsmkomvibviearwnjx` (`sectionId`,`siteId`),
  KEY `idx_ekbezkbajdefrnnakrjusvvgmsellvdlmdss` (`siteId`),
  CONSTRAINT `fk_kbjpojfjnugwkaqctjzfezddoxfzvkwkckvm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ulpxxhvgayrutodbhngfzdcjnfqzefwxyfmm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS sequences;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS sessions;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pgmrzjaivcwirwdsluciqyfwqjqgbfswdiuw` (`uid`),
  KEY `idx_kvhkiqyuvkvroqgdfpootmmzvionklabhhcj` (`token`),
  KEY `idx_fahsvotqmdijbukidzqlyodwvmbhysobuvaf` (`dateUpdated`),
  KEY `idx_nbfyvbeswgevmudzavqpkqdpdscdtlrrecsc` (`userId`),
  CONSTRAINT `fk_wkggyfhlialezdbtdakougcnrwmnyvqxceum` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS shunnedmessages;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mfarxsydeepylkmlwzfsdjwnfbijdrjvrazk` (`userId`,`message`),
  CONSTRAINT `fk_euqhfnsmuilwzkysxeyezyufrngpcjgptram` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS sitegroups;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_embofvntegaacnpojnsamzhskzfmvrrrxokk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS sites;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dtcncvzxjycgehnqalshrrjfpaievglqfwux` (`dateDeleted`),
  KEY `idx_thcuulaxzhekdpxruhlbvkhqcqonerugdwaf` (`handle`),
  KEY `idx_mwxawiwcsajrzcoloqrndemdmseonnndhqlb` (`sortOrder`),
  KEY `fk_gjqiyvqvfygdimajivftsquhxtlmqyhrhwve` (`groupId`),
  CONSTRAINT `fk_gjqiyvqvfygdimajivftsquhxtlmqyhrhwve` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS structureelements;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unvagzsbpjpzdvheeuomgyhevraipuaxwdce` (`structureId`,`elementId`),
  KEY `idx_bnkeubzofwseukntotewczrrlrpkkfhwpwne` (`root`),
  KEY `idx_ftbeqyanrzlxyjtuxgwlafuogpqcqlqpjuzi` (`lft`),
  KEY `idx_cytkdploqjcujpvwukxvwnkohonvardmaesy` (`rgt`),
  KEY `idx_rkssklbhdfoklocmwpzgdxitdmijyfiyxqsh` (`level`),
  KEY `idx_hjerwslqxkooufhipahpozznnbszazodxkgj` (`elementId`),
  CONSTRAINT `fk_chwhvtshldwcaolhloyoctsvuxlxmihrulnf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS structures;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nofgwwwcqohrgdrfppsioooowpbaamffexis` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS systemmessages;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vgvapoxpcjmxdvuyjeqeyhqflrukvmdveqyb` (`key`,`language`),
  KEY `idx_ehyasfrgrjujdnctmcyonxfgjdbwzcalzqor` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS taggroups;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_idebxclsaunuaegazxgvsjkibhaqaznezump` (`name`),
  KEY `idx_ieuqgueemuoytfkfubpvwxlxeuovgutcprer` (`handle`),
  KEY `idx_ipgqimulhisponnkxydghxmznuxnybebejmr` (`dateDeleted`),
  KEY `fk_qlfchqdphvqvxtmlytpdhsrjziazfaqhaxtp` (`fieldLayoutId`),
  CONSTRAINT `fk_qlfchqdphvqvxtmlytpdhsrjziazfaqhaxtp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS tags;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_djdmjjtsoehxphnwvrkmzxylxkshpfcwmimd` (`groupId`),
  CONSTRAINT `fk_jrkvfuylqcuzigtijiskxsdpbbisxalwevee` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mlulqqkcnvsxyvctdgrqljeqgqrgiyiqgett` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS tokens;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mzkqebactfvqxxsimcxadpgmorfmashsmcyn` (`token`),
  KEY `idx_jojjlecwkayjfstivnpsipalsaqzzaqurddj` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS usergroups;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gajshisgzehjzvvtlibapnkbmteotfbupjcr` (`handle`),
  KEY `idx_nponxlnbbyoscuubcybgnclcphqfiruxwuhw` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS usergroups_users;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hwagkecdcnojscyaefiiylwvzycxbzsvxhap` (`groupId`,`userId`),
  KEY `idx_udqiojivqnhwvbdprinjwuaxtnpnwilxyijn` (`userId`),
  CONSTRAINT `fk_bgyehzplfbzqekhvbadpjwutllwwjfvfqasy` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pppubjdhlgqiritxwzubdpexyyxsrapicrtb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS userpermissions;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ifmrqstmjrkkkxeuohykraircyaghthvpxqi` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS userpermissions_usergroups;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jcgwubpwbhooseyfqduvxwvxpfcjfsngsnbu` (`permissionId`,`groupId`),
  KEY `idx_dsqtlxdvibtbkbzhcrjaogjsnffbgflodskq` (`groupId`),
  CONSTRAINT `fk_azauyqnagwrqwfkicuvnleputxtixdnowgxn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_thhfhhvstjvsqtzrqssbpatznqeraehfkqxl` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS userpermissions_users;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_retmxwrqnwwnxvwdupzokumtuzqvkvzjrfni` (`permissionId`,`userId`),
  KEY `idx_wljozkilnwuexfdjgusgzothjkvzhrizzala` (`userId`),
  CONSTRAINT `fk_ommohovvezovgjzjkahaywpugcwvietavcnf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pcmvktzbbuilwirmivcensrdjbpzrejnwejz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS userpreferences;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_benoyuviusmqidiueodspwnktmpctzwbakkw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_avconqmocnpilfsjwaroaorwpzzwlqmrjyfs` (`active`),
  KEY `idx_ibnlspuwgcdgevzkfjzmjoudygpvsvhhnusb` (`locked`),
  KEY `idx_hpfeyfczysytfejkxoiavcaqluovbyznodji` (`pending`),
  KEY `idx_xepryjbjbyirlhmhslnmmeoyhlcaetjtumyq` (`suspended`),
  KEY `idx_hiqzejjwxowxncuzmjewgdoqcyqugsutyicg` (`verificationCode`),
  KEY `idx_kvniakavoxyzxgkllkgmbwtpriokgxhpffin` (`email`),
  KEY `idx_gmqkxzkbogapzxmurgspcllvrsbtiukkhamf` (`username`),
  KEY `fk_ubrxjnrrbymxkxdiykkhcmejtnogipqfahuc` (`photoId`),
  CONSTRAINT `fk_rhnrooxszidsvvwmyfnuvgrhzandlpkpyltv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ubrxjnrrbymxkxdiykkhcmejtnogipqfahuc` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS volumefolders;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ukwlticjpxvnzuuethwzrkphhduwzuhznjsg` (`name`,`parentId`,`volumeId`),
  KEY `idx_eioimigywmyacwlphpejsxjcezpmqfxggazc` (`parentId`),
  KEY `idx_eitqooghwpmtnsekvpnyplymqfxljniwhoig` (`volumeId`),
  CONSTRAINT `fk_iejdnnshwvxelxaqjdxnqfeevnimokfcnyoi` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rsiydkxzoqlmeenhmdnnsyscfchecxgrgneu` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS volumes;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cbyahrdxdaoohpgrmnarcqvyyxcedfviqzwj` (`name`),
  KEY `idx_efmtjwjbhpeeovizqjbtwtejjvgozzwbzlhl` (`handle`),
  KEY `idx_ezdjrvjbgxixdoimgivoyxxinttfdugawujs` (`fieldLayoutId`),
  KEY `idx_mpjwzrhywdsxdoggsxbruehurwoowiwwsicf` (`dateDeleted`),
  CONSTRAINT `fk_rxymaxghhrxnocjpiwfsaobcmtuhroicivrx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS wheelform_form_fields;
CREATE TABLE `wheelform_form_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `required` tinyint NOT NULL DEFAULT '0',
  `index_view` tinyint NOT NULL DEFAULT '0',
  `order` int DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `options` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ykpmsfygucdmnmrccsejbkydlpxfqdxyguia` (`active`),
  KEY `fk_ygqzhaaeefyykjyzbhhjeccwkwmuhksnysxl` (`form_id`),
  CONSTRAINT `fk_ygqzhaaeefyykjyzbhhjeccwkwmuhksnysxl` FOREIGN KEY (`form_id`) REFERENCES `wheelform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS wheelform_forms;
CREATE TABLE `wheelform_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `to_email` varchar(255) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `send_email` tinyint NOT NULL DEFAULT '0',
  `recaptcha` tinyint NOT NULL DEFAULT '0',
  `save_entry` tinyint NOT NULL DEFAULT '1',
  `options` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_rcrdcvkikfikttlxhubbgupqsjykqrpejsrs` (`site_id`),
  CONSTRAINT `fk_rcrdcvkikfikttlxhubbgupqsjykqrpejsrs` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS wheelform_message_values;
CREATE TABLE `wheelform_message_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int NOT NULL,
  `field_id` int NOT NULL,
  `value` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_efonbbqoxhnxboibhvzcuhylujlzjsexjjrw` (`message_id`),
  KEY `fk_bhdtocehexjwmnigxaalxeslfvdtmloliyme` (`field_id`),
  CONSTRAINT `fk_bhdtocehexjwmnigxaalxeslfvdtmloliyme` FOREIGN KEY (`field_id`) REFERENCES `wheelform_form_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_efonbbqoxhnxboibhvzcuhylujlzjsexjjrw` FOREIGN KEY (`message_id`) REFERENCES `wheelform_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS wheelform_messages;
CREATE TABLE `wheelform_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `read` tinyint NOT NULL DEFAULT '0',
  `options` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ebguvnayccbyycjadsbitdmxucwxsvvemjhd` (`form_id`),
  CONSTRAINT `fk_ebguvnayccbyycjadsbitdmxucwxsvvemjhd` FOREIGN KEY (`form_id`) REFERENCES `wheelform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS widgets;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zevpojnqinzzvwgeefdcqnngddjtcltrkato` (`userId`),
  CONSTRAINT `fk_xsnjyxesqgnhuvumkmdskhpvrzyawiurimde` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;