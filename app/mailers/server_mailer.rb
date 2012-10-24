class ServerMailer < ActionMailer::Base
  default from: "ov@microbac.com"

  def server_down_email(down_servers)
    @down_servers = down_servers
    @recipients = ["william.beasley@microbac.com"]
    mail(:to => @recipients, :subject => "Server Status Report")   do |format|
    format.html
    end


  end

end
