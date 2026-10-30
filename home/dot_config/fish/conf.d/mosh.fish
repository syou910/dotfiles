# mosh
set -gx MOSH_TITLE_NOPREFIX 1
set -gx MOSH_PREDICTION_DISPLAY adaptive

# MOSH_SERVER_* は mosh-server 側で解釈される値(クライアントからは転送されない。
# リモートで有効にするにはサーバ側の環境変数か ssh SendEnv/AcceptEnv が必要)。
set -gx MOSH_SERVER_NETWORK_TMOUT 86400
set -gx MOSH_SERVER_SIGNAL_TMOUT 600
