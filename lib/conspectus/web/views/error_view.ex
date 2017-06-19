defmodule Conspectus.Web.ErrorView do
  use Conspectus.Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  def render("error.json", %{errors: errors}) do
    translated_errors = errors
    |> Enum.reduce(%{}, fn ({key, value}, acc) -> Map.put(acc, key, translate_error(value)) end)

    %{errors: translated_errors}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
