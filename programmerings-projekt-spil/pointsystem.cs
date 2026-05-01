using Godot;
using System;
int points = 0;
public partial class pointsystem : TextEdit
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Input(InputEvent @event){
	if (@event is InputEventKey key && key.Pressed)
	{
		if (key.Keycode == Key.D)
		{
			
			points = player.position.x
			GD.Print(points);
		}
	}
}
}
