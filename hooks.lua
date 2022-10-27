
-- adjust time
function App.Hooks.CharIn(c)
    if not App.Data.Var.EditMode then return end

    -- seconds
    if c == 'u' then
        App.Data.Var.Start = App.Data.Var.Start - 1
        return true
    end
    if c == 'n' then
        App.Data.Var.Start = App.Data.Var.Start + 1
        return true
    end

    -- minutes
    if c == 't' then
        App.Data.Var.Start = App.Data.Var.Start - 60
        return true
    end
    if c == 'm' then
        App.Data.Var.Start = App.Data.Var.Start + 60
        return true
    end

    -- hours
    if c == 's' then
        App.Data.Var.Start = App.Data.Var.Start - (60 * 60)
        return true
    end
    if c == 'l' then
        App.Data.Var.Start = App.Data.Var.Start + (60 * 60)
        return true
    end

    -- days
    if c == 'r' then
        App.Data.Var.Start = App.Data.Var.Start - (60 * 60 * 24)
        return true
    end
    if c == 'k' then
        App.Data.Var.Start = App.Data.Var.Start + (60 * 60 * 24)
        return true
    end

    -- months
    if c == 'q' then
        App.Data.Var.Start = App.Data.Var.Start - (60 * 60 * 24 * 30)
        return true
    end
    if c == 'j' then
        App.Data.Var.Start = App.Data.Var.Start + (60 * 60 * 24 * 30)
        return true
    end

    -- years
    if c == 'p' then
        App.Data.Var.Start = App.Data.Var.Start - (31557600)
        return true
    end
    if c == 'i' then
        App.Data.Var.Start = App.Data.Var.Start + (31557600)
        return true
    end
end
