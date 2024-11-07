class PlayerPhase
    PLACING = :PLACING
    MOVING = :MOVING
    FLYING = :FLYING

    def self.all_phases
        [PLACING, MOVING, FLYING]
    end
end