cat << EOF >> ~/.ssh/config

HOST ${hostname}
    HostNamr ${hostname}
    User ${user}
    IdentityFile ${identityfile}
EOF