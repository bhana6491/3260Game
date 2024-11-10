class PlayerState
    PLACING = :PLACING
    MOVING = :MOVING
    FLYING = :FLYING
    REMOVE = :REMOVE

    def self.all_phases
        [PLACING, MOVING, FLYING, REMOVE]
    end
end