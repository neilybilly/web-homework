defmodule HomeworkWeb.UserView do
  use HomeworkWeb, :view
  alias HomeworkWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      dob: user.dob,
      first_name: user.first_name,
      last_name: user.last_name}
  end
end
