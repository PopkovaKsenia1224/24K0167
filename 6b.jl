using HorizonSideRobots

function perimetr!(robot)
    step_Sud, step_West=find!(robot)
    marker!(robot, step_Sud, step_West)
end

function find!(robot)
    step_West=0::Int
    step_Sud=0::Int
     while !isborder(robot, West) || !isborder(robot, Sud)
        while !isborder(robot, West)
            move!(robot, West)
            step_West+=1
        end
        while !isborder(robot, Sud)
            move!(robot, Sud)
            step_Sud+=1
        end
     end
    return step_Sud, step_West
end

function marker!(robot, step_Sud, step_West)
    k=0
    t=0
    move!(robot, Nord, step_Sud)
    putmarker!(robot)
    while isborder(robot, Nord)==false
        move!(robot, Nord)
        k+=1
    end
    move!(robot, Ost, step_West)
    putmarker!(robot)
    while isborder(robot, Ost)==false
        move!(robot, Ost)
        t+=1
    end
    move!(robot, Sud, k)
    putmarker!(robot)
    while isborder(robot, Sud)==false
        move!(robot, Sud)
    end
    move!(robot, West, t)
    putmarker!(robot)
    while isborder(robot, West)==false
        move!(robot, West)
    end
end   

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        if !ismarker(robot)
            move!(robot, side) 
        end
    end
end