class MessageMailer < ApplicationMailer
	default :to => "ridosolutions@gmail.com"

	def message_me(message)
		@message = message

		mail from: "Blah", subject: "Message From " + @message.name, body: @message.content
	end

end
