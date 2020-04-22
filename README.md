Acquia BLT Gitlab Pipelines integration
====

This is an [Acquia BLT](https://github.com/acquia/blt) plugin providing [Gitlab Pipelines](https://docs.gitlab.com/ee/ci/pipelines/) integration.

This plugin is **community-created** and **community-supported**. Acquia does not provide any direct support for this software or provide any warranty as to its stability.

## Installation and usage

To use this plugin, you must already have a Drupal project using BLT 11.3 (or higher). While the Environment Detector was added in BLT 10, the fix to properly [subclass was not introduced until this commit](https://github.com/acquia/blt/pull/4017) (and released in [11.3](https://github.com/acquia/blt/releases/tag/11.3.0))

In your project, require the plugin with Composer:

`composer require mikemadison13/blt-gitlab-pipelines`

Initialize the Gitlab integration by calling `recipes:ci:gitlab:init`, which is provided by this plugin:

`blt recipes:ci:gitlab:init`

This will copy a template version of the .gitlab-ci.yml to your project root directory. Make sure to commit this as well as your updated composer.json to Git.

Note: the template YAML file assumes standard BLT steps for builds (and is similar to the templated Travis CI and Acquia Piplines files). Modifications can be made as necessary! Build scripts can also be modified by copying them out of this plugin and changing the file path as needed in the YAML file. 

# License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 2 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
