module SimpleCreate
  extend ActiveSupport::Concern

  def render_create(me, success_message, redirect)
    respond_to do |format|
      if me.save
        format.html { redirect_to redirect, notice: success_message }
        format.json { render json: me, status: :created, location: me }
      else
        format.html { render action: "new" }
        format.json { render json: me.errors, status: :unprocessable_entity }
      end
    end
  end
end
