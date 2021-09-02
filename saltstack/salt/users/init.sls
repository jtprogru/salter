{% set salt_usergroups = salt['pillar.get']('users', default={}, merge=True) %}

{% for user, properties in salt_usergroups.items() -%}

"user-{{ user }}-create":
  user.present:
    - name: {{ user }}
    - fullname: {{ properties['fullname'] }}
    - shell: {{ properties['shell'] }}
    - password: {{ properties['password'] }}
    - groups: {{ properties['groups'] }}
    - usergroup: True
    - hash_password: True
    - enforce_password: False
    - createhome: False

"user-{{ user }}-homedir":
  file:
    - recurse
    - name: "/home/{{ user }}"
    - user: "{{ user }}"
    - group: "{{ user }}"
    - dir_mode: "0755"
    - source:
      - "salt://users/files/homes/{{ user }}"
      - "salt://users/files/default_home"
    - makedirs: True
    - include_empty: True

"user-{{ user }}-sshdir":
  file:
    - directory
    - name: "/home/{{ user }}/.ssh"
    - user: "{{ user }}"
    - group: "{{ user }}"
    - mode: "0700"
    - makedirs: True
    - require:
      - file: "user-{{ user }}-homedir"

"user-{{ user }}-authorized_keys":
  file:
    - managed
    - name: /home/{{ user }}/.ssh/authorized_keys
    - user: {{ user }}
    - group: {{ user }}
    - mode: '0400'
    - source: salt://users/templates/authorized_keys.jinja
    - template: jinja
    - makedirs: True
    - require:
      - file: 'user-{{ user }}-sshdir'

{% endfor -%}
