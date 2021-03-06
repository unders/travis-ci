class BuildMailer < ActionMailer::Base
  default :from => 'notifications@travis-ci.org'

  def finished_email(build)
    @build     = build
    subject    = "#{build.repository.slug}##{build.number} (#{build.commit[0, 7]}): the build has #{build.passed? ? 'passed' : 'failed' }"
    recipients = build.unique_recipients
    mail(:to => recipients, :subject => subject)
  end
end
