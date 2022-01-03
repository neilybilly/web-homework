defmodule HomeworkWeb.MerchantView do
  use HomeworkWeb, :view
  alias HomeworkWeb.MerchantView

  def render("index.json", %{merchants: merchants}) do
    %{data: render_many(merchants, MerchantView, "merchant.json")}
  end

  def render("show.json", %{merchant: merchant}) do
    %{data: render_one(merchant, MerchantView, "merchant.json")}
  end

  def render("merchant.json", %{merchant: merchant}) do
    %{id: merchant.id,
      name: merchant.name,
      description: merchant.description}
  end
end
