defmodule Tasks1Web.BlockController do
  use Tasks1Web, :controller

  alias Tasks1.TimeBlocks
  alias Tasks1.TimeBlocks.Block

  action_fallback Tasks1Web.FallbackController

  def index(conn, _params) do
    blocks = TimeBlocks.list_blocks()
    render(conn, "index.json", blocks: blocks)
  end

  def create(conn, %{"block" => block_params}) do
    with {:ok, %Block{} = block} <- TimeBlocks.create_block(block_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", block_path(conn, :show, block))
      |> render("show.json", block: block)
    end
  end

  def show(conn, %{"id" => id}) do
    block = TimeBlocks.get_block!(id)
    render(conn, "show.json", block: block)
  end

  def update(conn, %{"id" => id, "block" => block_params}) do
    block = TimeBlocks.get_block!(id)

    with {:ok, %Block{} = block} <- TimeBlocks.update_block(block, block_params) do
      render(conn, "show.json", block: block)
    end
  end

  def delete(conn, %{"id" => id}) do
    block = TimeBlocks.get_block!(id)
    with {:ok, %Block{}} <- TimeBlocks.delete_block(block) do
      send_resp(conn, :no_content, "")
    end
  end
end
