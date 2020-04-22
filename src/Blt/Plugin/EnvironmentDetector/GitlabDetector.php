<?php

namespace Acquia\GitlabPipelines\Blt\Plugin\EnvironmentDetector;

use Acquia\Blt\Robo\Common\EnvironmentDetector;

class GitlabDetector extends EnvironmentDetector {
    public static function getCiSettingsFile() {
        return sprintf('%s/vendor/mikemadison13/blt-gitlab-pipelines/settings/gitlab.settings.php', dirname(DRUPAL_ROOT));
    }
}
