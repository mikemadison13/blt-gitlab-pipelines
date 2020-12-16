<?php

/**
 * @file
 * GitLab environment specific settings.
 */

/**
 * Overwrite CI default database host name.
 *
 * @see ci.settings.php
 */
$databases['default']['default']['host'] = 'mysql';
$databases['default']['default']['password'] = 'drupal8';
$databases['default']['default']['username'] = 'drupal8';
$databases['default']['default']['database'] = 'drupal8';
