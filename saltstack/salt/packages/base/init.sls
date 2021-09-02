install_vim:
  pkg.installed:
    - name: {{ pillar['editor'] }}
