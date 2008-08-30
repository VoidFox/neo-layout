deadAsc(val, a) {
  global
  if !DeadSilence
    send % val
  DeadKey := a
}

deadUni(val, a) {
  global
  if !DeadSilence
    SendUnicodeChar(val)
  DeadKey := a
}

undeadAsc(val) {
  global
  if DeadSilence
    send % val
  else
    send % "{bs}" . val
}

undeadUni(val){
  global
  if !DeadSilence
    send {bs}
  SendUnicodeChar(val)
}

CheckDeadAsc(d,val) {
  global
  if (PriorDeadKey == d) {
    undeadAsc(val)
    return 1
  }
}

CheckDeadUni(d,val) {
  global
  if (PriorDeadKey == d) {
    undeadUni(val)
    return 1
  }
}

CheckDeadAsc12(d,val1,val2) {
  global
  if (PriorDeadKey == d){
    if (Ebene = 1) and (val1 != "") {
      undeadAsc(val1)
      return 1
    } else if (Ebene = 2) and (val2 != "") {
      undeadAsc(val2)
      return 1
    }
  }
}

CheckDeadUni12(d,val1,val2) {
  global
  if(PriorDeadKey == d) {
    if (Ebene = 1) and (val1 != "") {
      undeadUni(val1)
      return 1
    } else if (Ebene = 2) and (val2 != "") {
      undeadUni(val2)
      return 1
    }
  }
}

CheckCompAsc(d,val) {
  global
  if (PriorCompKey == d) {
    if !DeadCompose
      send {bs}
    send % val
    isSecondCompKey = 0
    return 1
  }
}

CheckCompAsc12(d,val1,val2) {
  global
  if (PriorCompKey == d)
    if (Ebene = 1) and (val1 != "") {
      if !DeadCompose
        send {bs}
      send % val1
      isSecondCompKey = 0
      return 1
    } else if (Ebene = 2) and (val2 != "") {
      if !DeadCompose
        send {bs}
      send % val2
      isSecondCompKey = 0
      return 1
    }
}

CheckCompUni(d,val) {
  global
  if (PriorCompKey == d) {
    PriorCompKey =
    if !DeadCompose
      send {bs}
    SendUnicodeChar(val)
    isSecondCompKey = 0
    return 1
  }
}

CheckCompUni12(d,val1,val2){
  global
  if (PriorCompKey == d) {
    if (Ebene = 1) and (val1 != "") {
      PriorCompKey =
      if !DeadCompose
        send {bs}
      SendUnicodeChar(val1)
      isSecondCompKey = 0
      return 1
    } else if (Ebene = 2) and (val2 != "") {
      PriorCompKey =
      if !DeadCompose
        send {bs}
      SendUnicodeChar(val2)
      isSecondCompKey = 0
      return 1
    }
  }
}

CheckComp3Uni(d,val) {
  global
  if (PriorCompKey == d) {
    PriorCompKey =
    if !DeadCompose
      send {bs}{bs}
    SendUnicodeChar(val)
    isSecondCompKey = 0
    return 1
  }
}

CheckComp3Uni12(d,val1,val2) {
  global
  if (PriorCompKey == d) {
    if (Ebene = 1) and (val1 != "") {
      PriorCompKey =
      if !DeadCompose
        send {bs}{bs}
      SendUnicodeChar(val1)
      isSecondCompKey = 0
      return 1
    } else if (Ebene = 2) and (val2 != "") {
      PriorCompKey =
      if !DeadCompose
        send {bs}{bs}
      SendUnicodeChar(val2)
      isSecondCompKey = 0
      return 1
    }
  }
}

OutputChar(val) {
  global
  if !((CheckComp(val) or PriorCompKey) and DeadCompose)
    send % "{blind}" . val
}

OutputChar12(val1,val2) {
  global
  if (Ebene = 1)
    c := val1
  else c := val2
  if !((CheckComp(c) or PriorCompKey) and DeadCompose)
    if GetKeyState("Shift","P") and isMod2Locked
      send % "{blind}{Shift Up}" . c . "{Shift Down}"
    else send % "{blind}" . c
}

CheckComp(d) {
  global
  if (PriorDeadKey = "comp") {
    CompKey := d
    return 1
  } else if isSecondCompKey {
    isSecondCompKey = 0
    CompKey =
    PriorCompKey =
    ;goto neo_%lastHook%
  } else if PriorCompKey {
    CompKey := PriorCompKey . "_" . d
    isSecondCompKey = 1
    return 1
  }
}
