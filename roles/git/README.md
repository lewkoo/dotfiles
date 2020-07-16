git
===

Installs and configures git.

## Signing commits with GPG

Follow the instructions [here](https://github.com/pstadler/keybase-gpg-github) to create a GPG on keybase and set it up to use with GitHub.

Then, in `group_vars/local`, set `git_signing_key` to the ID of the GPG key you use to sign commits.

```bash
$ gpg --list-secret-keys
# /Users/lev/.gnupg/pubring.kbx
# -----------------------------
# sec   rsa4096 2020-07-16 [SC] [expires: 2036-07-12]
#       FB21D86FD40CBE2B42AB5BEEFF7E2F5B2137632F
# uid           [ unknown] Levko Ivanchuk <lewkoo@gmail.com>
# uid           [ unknown] Levko Ivanchuk <levko@livanchuk.com>
# ssb   rsa4096 2020-07-16 [E] [expires: 2036-07-12]
```

```yaml
# In group_vars/local

git_signing_key: E870EE00
```

If you do **not** wish to sign commits with GPG, just set `git_signing_key` to a blank variable.

```yaml
# No GPG signing
# In group_vars/local

git_signing_key:
```
