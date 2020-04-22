<?php

namespace Acquia\GitlabPipelines\Blt\Plugin\Commands;

use Acquia\Blt\Robo\BltTasks;
use Acquia\Blt\Robo\Exceptions\BltException;
use Robo\Contract\VerbosityThresholdInterface;

/**
 * Defines commands related to Gitlab.
 */
class GitlabCommands extends BltTasks {

  /**
   * Initializes default Gitlab Pipelines configuration for this project.
   *
   * @command recipes:ci:gitlab:init
   * @throws \Acquia\Blt\Robo\Exceptions\BltException
   */
  public function azureInit() {
    $result = $this->taskFilesystemStack()
      ->copy($this->getConfigValue('repo.root') . '/vendor/mikemadison13/blt-gitlab-pipelines/.gitlab-ci.yml', $this->getConfigValue('repo.root') . '/.gitlab-ci.yml', TRUE)
      ->stopOnFail()
      ->setVerbosityThreshold(VerbosityThresholdInterface::VERBOSITY_VERBOSE)
      ->run();

    if (!$result->wasSuccessful()) {
      throw new BltException("Could not initialize Gitlab configuration.");
    }

    $this->say("<info>A pre-configured Gitlab Pipelines file was copied to your repository root.</info>");
  }

}
