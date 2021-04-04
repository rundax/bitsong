#!/usr/bin/env bash

set -e
set -u
set -o pipefail

cat > /src/config/user_config_main.ini <<EOF
[general]
unique_alerter_identifier = ${GENERAL_UNIQUE_ALERTER_IDENTIFIER:=panic-cosmos-alerter}

[telegram_alerts]
enabled = ${TELEGRAM_ALERTS_ENABLED:=True}
bot_token = ${TELEGRAM_ALERTS_BOT_TOKEN:=123456789:ABCDEF-1234abcd5678efgh12345_abc123}
bot_chat_id = ${TELEGRAM_ALERTS_BOT_CHAT_ID:=123456789}

[email_alerts]
enabled = False
smtp = my.smtp.com
from = alerter@email.com
to = user@email.com
user = my_username
pass = my_password

[twilio_alerts]
enabled = False
account_sid = abcd1234efgh5678ABCD1234EFGH567890
auth_token = 1234abcd5678efgh1234abcd5678efgh
twilio_phone_number = +12025551234
phone_numbers_to_dial = +12025551235;+12025551236;+12025551237

[telegram_commands]
enabled = ${TELEGRAM_COMMANDS_ENABLED:=False}
bot_token = ${TELEGRAM_COMMANDS_BOT_TOKEN:=123456789:ABCDEF-1234abcd5678efgh12345_abc123}
bot_chat_id = ${TELEGRAM_COMMANDS_BOT_CHAT_ID:=123456789}

[redis]
enabled = True
host = localhost
port = 6379
password = HMASDNoiSADnuiasdgnAIO876hg967bv99vb8buyT8BVuyT76VBT76uyi

[periodic_alive_reminder]
enabled = True
interval_seconds = 3600
email_enabled = False
telegram_enabled = True
EOF