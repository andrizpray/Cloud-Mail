-- Cloud Mail Database Dump
-- Generated: LOCAL DEV

-- Table: account

CREATE TABLE account (
			account_id INTEGER PRIMARY KEY AUTOINCREMENT,
			email TEXT NOT NULL,
			status INTEGER DEFAULT 0 NOT NULL,
			latest_email_time DATETIME,
			create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
			user_id INTEGER NOT NULL,
			is_del INTEGER DEFAULT 0 NOT NULL
		  , name TEXT NOT NULL DEFAULT '', all_receive INTEGER NOT NULL DEFAULT 0, sort INTEGER NOT NULL DEFAULT 0);

INSERT INTO account (account_id, email, status, latest_email_time, create_time, user_id, is_del, name, all_receive, sort) VALUES (1, 'admin@example.com', 0, NULL, '2026-05-09 08:05:36', 1, 0, 'admin', 0, 0);

-- Table: attachments

CREATE TABLE attachments (
			att_id INTEGER PRIMARY KEY AUTOINCREMENT,
			user_id INTEGER NOT NULL,
			email_id INTEGER NOT NULL,
			account_id INTEGER NOT NULL,
			key TEXT NOT NULL,
			filename TEXT,
			mime_type TEXT,
			size INTEGER,
			disposition TEXT,
			related TEXT,
			content_id TEXT,
			encoding TEXT,
			create_time DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
		  , status INTEGER NOT NULL DEFAULT 0, type INTEGER NOT NULL DEFAULT 0);

-- Table: email

CREATE TABLE email (
			email_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			send_email TEXT,
			name TEXT,
			account_id INTEGER NOT NULL,
			user_id INTEGER NOT NULL,
			subject TEXT,
			content TEXT,
			text TEXT,
			create_time DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
			is_del INTEGER DEFAULT 0 NOT NULL
		  , type INTEGER NOT NULL DEFAULT 0, status INTEGER NOT NULL DEFAULT 0, resend_email_id TEXT, message TEXT, recipient TEXT NOT NULL DEFAULT '[]', cc TEXT NOT NULL DEFAULT '[]', bcc TEXT NOT NULL DEFAULT '[]', message_id TEXT NOT NULL DEFAULT '', in_reply_to TEXT NOT NULL DEFAULT '', relation TEXT NOT NULL DEFAULT '', to_email TEXT NOT NULL DEFAULT '', to_name TEXT NOT NULL DEFAULT '', unread INTEGER NOT NULL DEFAULT 0);

-- Table: oauth

CREATE TABLE oauth (
					oauth_id INTEGER PRIMARY KEY AUTOINCREMENT,
					oauth_user_id TEXT,
					username TEXT,
					name TEXT,
					avatar TEXT,
					active INTEGER,
					trust_level INTEGER,
					silenced INTEGER,
					create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
					platform INTEGER NOT NULL DEFAULT 0,
					user_id INTEGER NOT NULL DEFAULT 0
				);

-- Table: perm

CREATE TABLE perm (
        perm_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        perm_key TEXT,
        pid INTEGER NOT NULL DEFAULT 0,
        type INTEGER NOT NULL DEFAULT 2,
        sort INTEGER
      );

INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (1, '邮件', NULL, 0, 0, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (2, '邮件删除', 'email:delete', 1, 2, 1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (3, '邮件发送', 'email:send', 1, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (4, '个人设置', '', 0, 1, 2);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (5, '用户注销', 'my:delete', 4, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (6, '用户信息', NULL, 0, 1, 3);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (7, '用户查看', 'user:query', 6, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (8, '密码修改', 'user:set-pwd', 6, 2, 2);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (9, '状态修改', 'user:set-status', 6, 2, 3);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (10, '权限修改', 'user:set-type', 6, 2, 4);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (11, '用户删除', 'user:delete', 6, 2, 7);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (13, '权限控制', '', 0, 1, 5);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (14, '身份查看', 'role:query', 13, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (15, '身份修改', 'role:set', 13, 2, 1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (16, '身份删除', 'role:delete', 13, 2, 2);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (17, '系统设置', '', 0, 1, 6);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (18, '设置查看', 'setting:query', 17, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (19, '设置修改', 'setting:set', 17, 2, 1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (21, '邮箱侧栏', '', 0, 0, 1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (22, '邮箱查看', 'account:query', 21, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (23, '邮箱添加', 'account:add', 21, 2, 1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (24, '邮箱删除', 'account:delete', 21, 2, 2);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (25, '用户添加', 'user:add', 6, 2, 1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (26, '发件重置', 'user:reset-send', 6, 2, 6);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (27, '邮件列表', '', 0, 1, 4);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (28, '邮件查看', 'all-email:query', 27, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (29, '邮件删除', 'all-email:delete', 27, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (30, '身份添加', 'role:add', 13, 2, -1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (31, '分析页', NULL, 0, 1, 2.1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (32, '数据查看', 'analysis:query', 31, 2, 1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (33, '注册密钥', NULL, 0, 1, 5.1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (34, '密钥查看', 'reg-key:query', 33, 2, 0);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (35, '密钥添加', 'reg-key:add', 33, 2, 1);
INSERT INTO perm (perm_id, name, perm_key, pid, type, sort) VALUES (36, '密钥删除', 'reg-key:delete', 33, 2, 2);

-- Table: reg_key

CREATE TABLE reg_key (
				rege_key_id INTEGER PRIMARY KEY AUTOINCREMENT,
				code TEXT NOT NULL COLLATE NOCASE DEFAULT '',
				count INTEGER NOT NULL DEFAULT 0,
				role_id INTEGER NOT NULL DEFAULT 0,
				user_id INTEGER NOT NULL DEFAULT 0,
				expire_time DATETIME,
				create_time DATETIME DEFAULT CURRENT_TIMESTAMP
      );

-- Table: role

CREATE TABLE role (
        role_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        key TEXT,
        create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
        sort INTEGER DEFAULT 0,
        description TEXT,
        user_id INTEGER,
        is_default INTEGER DEFAULT 0,
        send_count INTEGER,
        send_type TEXT NOT NULL DEFAULT 'count',
        account_count INTEGER
      , ban_email TEXT NOT NULL DEFAULT '', ban_email_type INTEGER NOT NULL DEFAULT 0, avail_domain TEXT NOT NULL DEFAULT '');

INSERT INTO role (role_id, name, key, create_time, sort, description, user_id, is_default, send_count, send_type, account_count, ban_email, ban_email_type, avail_domain) VALUES (1, '普通用户', NULL, '0000-00-00 00:00:00', 0, '只有普通使用权限', 0, 1, NULL, 'ban', 10, '', 0, '');

-- Table: role_perm

CREATE TABLE role_perm (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        role_id INTEGER,
        perm_id INTEGER
      );

INSERT INTO role_perm (id, role_id, perm_id) VALUES (100, 1, 2);
INSERT INTO role_perm (id, role_id, perm_id) VALUES (101, 1, 21);
INSERT INTO role_perm (id, role_id, perm_id) VALUES (102, 1, 22);
INSERT INTO role_perm (id, role_id, perm_id) VALUES (103, 1, 23);
INSERT INTO role_perm (id, role_id, perm_id) VALUES (104, 1, 24);
INSERT INTO role_perm (id, role_id, perm_id) VALUES (105, 1, 4);
INSERT INTO role_perm (id, role_id, perm_id) VALUES (106, 1, 5);
INSERT INTO role_perm (id, role_id, perm_id) VALUES (107, 1, 1);
INSERT INTO role_perm (id, role_id, perm_id) VALUES (108, 1, 3);

-- Table: setting

CREATE TABLE setting (
			register INTEGER NOT NULL,
			receive INTEGER NOT NULL,
			add_email INTEGER NOT NULL,
			many_email INTEGER NOT NULL,
			title TEXT NOT NULL,
			auto_refresh INTEGER NOT NULL,
			register_verify INTEGER NOT NULL,
			add_email_verify INTEGER NOT NULL
		  , resend_tokens TEXT NOT NULL DEFAULT '{}', send INTEGER NOT NULL DEFAULT 0, r2_domain TEXT, site_key TEXT, secret_key TEXT, background TEXT, login_opacity INTEGER NOT NULL DEFAULT 0.90, tg_bot_token TEXT NOT NULL DEFAULT '', tg_chat_id TEXT NOT NULL DEFAULT '', tg_bot_status INTEGER NOT NULL DEFAULT 1, forward_email TEXT NOT NULL DEFAULT '', forward_status INTEGER TIME NOT NULL DEFAULT 1, rule_email TEXT NOT NULL DEFAULT '', rule_type INTEGER NOT NULL DEFAULT 0, reg_key INTEGER NOT NULL DEFAULT 1, reg_verify_count INTEGER NOT NULL DEFAULT 1, add_verify_count INTEGER NOT NULL DEFAULT 1, notice_title TEXT NOT NULL DEFAULT 'Cloud Mail', notice_content TEXT NOT NULL DEFAULT '', notice_type TEXT NOT NULL DEFAULT 'none', notice_duration INTEGER NOT NULL DEFAULT 0, notice_offset INTEGER NOT NULL DEFAULT 0, notice_position TEXT NOT NULL DEFAULT 'top-right', notice_width INTEGER NOT NULL DEFAULT 340, notice INTEGER NOT NULL DEFAULT 0, no_recipient INTEGER NOT NULL DEFAULT 1, login_domain INTEGER NOT NULL DEFAULT 0, bucket TEXT NOT NULL DEFAULT '', region TEXT NOT NULL DEFAULT '', endpoint TEXT NOT NULL DEFAULT '', s3_access_key TEXT NOT NULL DEFAULT '', s3_secret_key TEXT NOT NULL DEFAULT '', force_path_style	INTEGER NOT NULL DEFAULT 1, custom_domain TEXT NOT NULL DEFAULT '', tg_msg_to TEXT NOT NULL DEFAULT 'show', tg_msg_from TEXT NOT NULL DEFAULT 'only-name', tg_msg_text TEXT NOT NULL DEFAULT 'show', min_email_prefix INTEGER NOT NULL DEFAULT 1, email_prefix_filter text NOT NULL DEFAULT '', black_subject TEXT NOT NULL DEFAULT '', black_content TEXT NOT NULL DEFAULT '', black_from TEXT NOT NULL DEFAULT '');

INSERT INTO setting (register, receive, add_email, many_email, title, auto_refresh, register_verify, add_email_verify, resend_tokens, send, r2_domain, site_key, secret_key, background, login_opacity, tg_bot_token, tg_chat_id, tg_bot_status, forward_email, forward_status, rule_email, rule_type, reg_key, reg_verify_count, add_verify_count, notice_title, notice_content, notice_type, notice_duration, notice_offset, notice_position, notice_width, notice, no_recipient, login_domain, bucket, region, endpoint, s3_access_key, s3_secret_key, force_path_style, custom_domain, tg_msg_to, tg_msg_from, tg_msg_text, min_email_prefix, email_prefix_filter, black_subject, black_content, black_from) VALUES (0, 0, 0, 0, 'Cloud Mail', 0, 1, 1, '{}', 0, NULL, NULL, NULL, NULL, 0.9, '', '', 1, '', 1, '', 0, 1, 1, 1, 'Cloud Mail', '本项目仅供学习交流，禁止用于违法业务
<br>
请遵守当地法规，作者不承担任何法律责任', 'none', 0, 0, 'top-right', 340, 0, 1, 0, '', '', '', '', '', 1, '', 'show', 'only-name', 'show', 1, '', '', '', '');

-- Table: star

CREATE TABLE star (
			star_id INTEGER PRIMARY KEY AUTOINCREMENT,
			user_id INTEGER NOT NULL,
			email_id INTEGER NOT NULL,
			create_time DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
		  );

-- Table: user

CREATE TABLE user (
			user_id INTEGER PRIMARY KEY AUTOINCREMENT,
			email TEXT NOT NULL,
			type INTEGER DEFAULT 1 NOT NULL,
			password TEXT NOT NULL,
			salt TEXT NOT NULL,
			status INTEGER DEFAULT 0 NOT NULL,
			create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
			active_time DATETIME,
			is_del INTEGER DEFAULT 0 NOT NULL
		  , create_ip TEXT, active_ip TEXT, os TEXT, browser TEXT, device TEXT, sort INTEGER NOT NULL DEFAULT 0, send_count INTEGER NOT NULL DEFAULT 0, reg_key_id INTEGER NOT NULL DEFAULT 0);

INSERT INTO user (user_id, email, type, password, salt, status, create_time, active_time, is_del, create_ip, active_ip, os, browser, device, sort, send_count, reg_key_id) VALUES (1, 'admin@example.com', 1, '1I7o54mDcvCECnkd8TCeeRA7xRCsDDowNpCK2YWZP88=', 'CQPN1Gfc+OoBE4hwuA/bgA==', 0, '2026-05-09 08:05:36', '2026-05-09 16:06:07', 0, NULL, '127.0.0.1', '', '', 'Desktop', 0, 0, 0);

-- Table: verify_record

CREATE TABLE verify_record (
				vr_id INTEGER PRIMARY KEY AUTOINCREMENT,
				ip TEXT NOT NULL DEFAULT '',
				count INTEGER NOT NULL DEFAULT 1,
				type INTEGER NOT NULL DEFAULT 0,
				update_time DATETIME DEFAULT CURRENT_TIMESTAMP
      );

