speakers = {}

function speakers_init()
    clear_table(speakers)
    speakers = get_objects_for_sprite_num(64,16,16,"speaker")
    for speaker in all(speakers) do
        local frames = { {x=0, y=32, w=16, h=16}, {x=0, y=48, w=16, h=16} }
        speaker.animation = animation_new(frames, 29)
    end
end

function speakers_update()
    for speaker in all(speakers) do
        animation_update(speaker.animation)
    end
end

function speakers_draw()
    for speaker in all(speakers) do
        animation_draw(speaker.animation, speaker.x, speaker.y)
    end
end