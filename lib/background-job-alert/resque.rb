module BackgroundJobAlert
  class ResqueAlert
    def self.validate(job_limit:, slack_channel: nil)
      queues = get_pending_queues(job_limit)

      slack_message = ""
      queues.each do |queue|
        slack_message += "Resque queue `#{queue[:name]}` has `#{queue[:size]}` pending jobs\n"
      end
      slack_message += "----------------------------------------------"

      SlackWrapper.post_message(
        text: slack_message,
        channel: slack_channel
      )
    end

    def self.get_pending_queues(job_limit)
      queues = []
      Resque.queues.each do |queue|
        size = Resque.size(queue)
        if size > job_limit
          queues << { name: queue, size: size }
        end
      end

      queues
    end
  end
end
