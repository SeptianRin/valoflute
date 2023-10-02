class Role {
  String name;
  String description;
  String icon;

  Role(this.name, this.description, this.icon);
}

var listRole = {
  "Initiator": Role("Initiator",
      "Initiators challenge angles by setting up their team to enter contested ground and push defenders away.",
      "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png"),
  "Duelist": Role("Duelist",
      "Duelists are self-sufficient fraggers who their team expects, through abilities and skills, to get high frags and seek out engagements first.",
      "https://media.valorant-api.com/agents/roles/dbe8757e-9e92-4ed4-b39f-9dfc589691d4/displayicon.png"),
  "Sentinel": Role("Sentinel",
      "Sentinels are defensive experts who can lock down areas and watch flanks, both on attacker and defender rounds.",
      "https://media.valorant-api.com/agents/roles/5fc02f99-4091-4486-a531-98459a3e95e9/displayicon.png"),
  "Controller": Role("Controller",
      "Controllers are experts in slicing up dangerous territory to set their team up for success.",
      "https://media.valorant-api.com/agents/roles/4ee40330-ecdd-4f2f-98a8-eb1243428373/displayicon.png"),
};