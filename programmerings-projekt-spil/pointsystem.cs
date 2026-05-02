using Godot;
using System;

public partial class pointsystem : Node2D
{
	int points = 0;

	public override void _Process(double delta)
	{
		if (Input.IsKeyPressed(Key.Right))
		{
			points++;
			GD.Print(points);
			
		}
		
	}
}
