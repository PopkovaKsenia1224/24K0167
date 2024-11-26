using HorizonSideRobots

function perimetr!(robot)
    find!(robot)
    marker!(robot)
end

function find!(robot)
     while !isborder(robot, West) || !isborder(robot, Sud)
        while !isborder(robot, West)
            move!(robot, West)
        end
        while !isborder(robot, Sud)
            move!(robot, Sud)
        end
     end
end

function marker!(robot)
    for side ∈ (Nord, Ost, Sud, West)
        while isborder(robot, side)==false
            move!(robot, side)
            putmarker!(robot)
        end
    end
end   