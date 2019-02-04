defmodule Mix.Tasks.Hummer.Run do
  use Mix.Task

  @shortdoc "Run applications whos names passed as arguments"
  def run(apps) do
    if Process.whereis(Logger) do
      Logger.App.stop()
    end

    for app <- apps do
      {:ok, _} = Application.ensure_all_started(String.to_existing_atom(app), :permanent)
    end
  end
end
