defmodule Web.Admin.QuestStepView do
  use Web, :view

  alias Web.Item
  alias Web.NPC
  alias Data.QuestStep

  defdelegate types, to: QuestStep

  def type_form("item/collect"), do: "_item_collect"
  def type_form("item/give"), do: "_item_give"
  def type_form("item/have"), do: "_item_have"
  def type_form("npc/kill"), do: "_npc_kill"
  def type_form("room/explore"), do: "_room_explore"

  def type_help("item/collect"), do: "quest.item_collect"
  def type_help("item/give"), do: "quest.item_give"
  def type_help("item/have"), do: "quest.item_have"
  def type_help("npc/kill"), do: "quest.npc_kill"
  def type_help("room/explore"), do: "quest.room_explore"
end
