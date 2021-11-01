Acquia BLT Gitlab Pipelines integration
====

This is an [Acquia BLT](https://github.com/acquia/blt) plugin providing [Gitlab Pipelines](https://docs.gitlab.com/ee/ci/pipelines/) integration. This plugin will work with both Gitlab and Acquia Code Studio Pipelines!

This plugin is **community-created** and **community-supported**. Acquia does not provide any direct support for this software or provide any warranty as to its stability.

## Installation and usage

To use this plugin, you must already have a Drupal project using BLT 11.3 (or higher). While the Environment Detector was added in BLT 10, the fix to properly [subclass was not introduced until this commit](https://github.com/acquia/blt/pull/4017) (and released in [11.3](https://github.com/acquia/blt/releases/tag/11.3.0))

### 1. In your project, require the plugin with Composer:

`composer require mikemadison13/blt-gitlab-pipelines`

### 2. Initialize the Gitlab integration by calling `recipes:ci:gitlab:init`, which is provided by this plugin:

`blt recipes:ci:gitlab:init`

This will copy a template version of the .gitlab-ci.yml to your project root directory. Make sure to commit this as well as your updated composer.json to Git.

Note: the template YAML file assumes standard BLT steps for builds (and is similar to the templated Travis CI and Acquia Piplines files). Modifications can be made as necessary! Build scripts can also be modified by copying them out of this plugin and changing the file path as needed in the YAML file.

### 3. Generate and Integrate SSH Keys

In order to utilize Pipelines to deploy into your hosting environment, you must utilize SSH keys for security. While the Plugin does come with the necessary defaults for Acquia Cloud deployments, there are manual steps required to complete the process.

Overall, the process looks like:

- [Generate a new SSH key](https://docs.gitlab.com/ee/ssh/#generate-an-ssh-key-pair) on your local machine for use by Pipelines. Note that you must generate an RSA key for use in the Acquia Cloud.
- Upload the public version of the SSH key into both your [Gitlab / Acquia Code Studio Account](https://docs.gitlab.com/ee/ssh/#add-an-ssh-key-to-your-gitlab-account) AND your [Acquia Cloud Account](https://docs.acquia.com/cloud-platform/manage/ssh/enable/add-key/)
- Upload the private version of the SSH key into your [Settings in Gitlab](https://docs.gitlab.com/ee/ci/ssh_keys/#how-it-works) as a CI/CD Variable called SSH_KEY

Note that this plugin assumes that the "variable" is called SSH_KEY in Gitlab. If you name your variable anything else (or if you use a passphrase) you will need to customize the before_script section of the deploy step to ensure that you are utilizing the correct variable name.

### 4. Customize the generated .gitlab-ci.yml file

The variables section of the gitlab file includes a number of items that should be customized. This includes:

PHP_VERSION which defaults to 8.0
NODE_VERSION which defaults to 14.x

These variables should match your project defaults for these technologies.


# License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 2 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
