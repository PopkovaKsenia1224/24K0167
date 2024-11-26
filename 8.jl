using HorizonSideRobots

function petly!(robot)
    side1=Nord
    side2=West
    for step in 1: 10
        for side in (side1, side2)
            move!(robot, side, step)
        end
        side1=inverse(side1)
        side2=inverse(side2)
    end 
end

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        if !ismarker(robot)
            move!(robot, side) 
        end
    end
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)