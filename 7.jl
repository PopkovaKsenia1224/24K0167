using HorizonSideRobots

function exit!(robot)
    side=Ost
    for step in 1: 100
        if isborder(robot, Nord)
            move!(robot, side, step)
            side=inverse(side)
        end
    end
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)
    end
end