#include "irqstate.h"
#include "sam3x8e.h"


irqstate* handle_irq(irqstate* state)
{
  IPSR_Type type;
  type.w = __get_IPSR();

  return state;
}
