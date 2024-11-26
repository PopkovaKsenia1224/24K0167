using HorizonSideRobots

function finish!(robot)
    step_Sud=do_upora!(robot, Sud)
    step_West=do_upora!(robot, West)
    perimetr!(robot)
    side1=find!(robot)
    mal_perimetr!(robot, side1)
    do_upora!(robot, Sud)
    do_upora!(robot, West)
    move!(robot, Ost, step_West)
    move!(robot, Nord, step_Sud)
end

function mal_perimetr!(robot, side1)
    if side1==West
        for side2 in (Nord, West, Sud, Ost)
            while isborder(robot, reverse(side2, 2))
                putmarker!(robot)
                move!(robot, side2)
            end
            putmarker!(robot)
            move!(robot, reverse(side2, 2))
        end
    else
        for side2 in (Nord, Ost, Sud, West)
            while isborder(robot, reverse(side2, 1))
                putmarker!(robot)
                move!(robot, side2)
            end
            putmarker!(robot)
            move!(robot, reverse(side2, 1))
        end
    end
end

function find!(robot)
    side=Ost
    while (!isborder(robot, side) && !isborder(robot, Nord))
        do_upora!(robot, side)
        side=inverse(side)
        if !ismarker(robot)
            break
        else 
            move!(robot, Nord)
        end
    end
    return inverse(side)
end

function do_upora!(robot::Robot, send::HorizonSide)
    n::Int=0
    while !isborder(robot, send)
        move!(robot, send)
        n+=1
    end
    return n
end

reverse(side::HorizonSide, n)=HorizonSide((4+Int(side)+(-1)^n)%4)
inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)

function perimetr!(robot)
    for side ∈ (Nord, Ost, Sud, West)
        while isborder(robot, side)==false
            move!(robot, side)
            putmarker!(robot)
        end
    end
end   

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)
    end
end