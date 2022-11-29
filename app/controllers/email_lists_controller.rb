
require 'ostruct'
require 'erb'

class EmailListsController < ApplicationController
  before_action :set_email_list, only: %i[ show update destroy ]
  wrap_parameters email_list: [:json, :url_encoded_form, :multipart_form]

  # GET /email_lists?email=lucas.zaia@gmail.com
  def create
    @email_list = EmailList.new(email_list_params)

      if EmailList.where(:email => email_list_params[:email]).exists?
        messages = print_messages("Seu E-mail já foi removido de nossa base de dados")
        render html: render_tpl(messages).html_safe
      else
        if @email_list.save
          messages = print_messages('Que pena,seu e-mail foi removido da nossa base de dados')
          render html: render_tpl(messages).html_safe
        else
          render json: @email_list.errors, status: :unprocessable_entity
        end
      end
  end
  
  def print_messages message
    OpenStruct.new(messages: message)
  end

  def render_tpl messages
    template = File.read("#{Rails.root}/app/views/email_lists/template.html.erb")
    ERB.new(template).result(messages.instance_eval {binding})
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_list
      @email_list = EmailList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_list_params
      params.permit(:email)
    end
end
