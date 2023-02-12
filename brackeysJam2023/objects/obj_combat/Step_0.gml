//state machine
state_changed = state != state_prev;
state_prev = state;

arr_states_functions[state]();