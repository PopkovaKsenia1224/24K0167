using HorizonSideRobots

function cross!(robot)
    for side1 in (Nord, Sud)
        for side2 in (Ost, West)
            step=marker!(robot, side1, side2)
            move!(robot, inverse(side1), step)
            move!(robot, inverse(side2), step)
        end
    end
    putmarker!(robot)
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)          
    end
end

function marker!(robot, side1, side2)
    step=0::Int
    while (!isborder(robot, side1) && !isborder(robot, side2))
        move!(robot, side1)
        move!(robot, side2)
        putmarker!(robot)
        step+=1
    end
    return step
end