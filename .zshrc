# ==========================================
# 1. Path & Environment
# ==========================================
# Homebrew の初期化（ここで自動的に /opt/homebrew/bin 等の PATH が通る）
eval "$(/opt/homebrew/bin/brew shellenv)"

# Local binaries
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=nvim

# ==========================================
# 2. Functions & Aliases
# ==========================================
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ==========================================
# 3. Tool Initializations
# ==========================================
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(mise activate zsh)"

# ==========================================
# 4. Plugins (※読み込み順に注意)
# ==========================================

# zsh-abbr
[[ -f /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh ]] && source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh

# zsh-autosuggestions
[[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting（必ず最後）
[[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
