defmodule HomeworkWeb.MerchantController do
  use HomeworkWeb, :controller

  alias Homework.Merchants
  alias Homework.Merchants.Merchant

  def index(conn, _params) do
    merchants = Merchants.list_merchants(conn.query_params)
    render(conn, "index.json", merchants: merchants)
  end

  def create(conn, %{"merchant" => merchant_params}) do
    with {:ok, %Merchant{} = merchant} <- Merchants.create_merchant(merchant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.merchant_path(conn, :show, merchant))
      |> render("show.json", merchant: merchant)
    end
  end

  def update(conn, %{"id" => id, "merchant" => merchant_params}) do
    merchant = Merchants.get_merchant!(id)

    with {:ok, %Merchant{} = merchant} <- Merchants.update_merchant(merchant, merchant_params) do
      render(conn, "show.json", merchant: merchant)
    end
  end

  def delete(conn, %{"id" => id}) do
    merchant = Merchants.get_merchant!(id)
    with {:ok, %Merchant{}} <- Merchants.delete_merchant(merchant) do
      send_resp(conn, :no_content, "")
    end
  end
end
