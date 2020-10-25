# automatically generated by the FlatBuffers compiler, do not modify

# namespace: BridgeMessages

import flatbuffers
from flatbuffers.compat import import_numpy
np = import_numpy()

class CaptureResponse(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAsCaptureResponse(cls, buf, offset):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = CaptureResponse()
        x.Init(buf, n + offset)
        return x

    # CaptureResponse
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # CaptureResponse
    def Samples(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Int32Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 4))
        return 0

    # CaptureResponse
    def SamplesAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Int32Flags, o)
        return 0

    # CaptureResponse
    def SamplesLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # CaptureResponse
    def SamplesIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        return o == 0

    # CaptureResponse
    def Spectrum(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Float64Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 8))
        return 0

    # CaptureResponse
    def SpectrumAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Float64Flags, o)
        return 0

    # CaptureResponse
    def SpectrumLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # CaptureResponse
    def SpectrumIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        return o == 0

def CaptureResponseStart(builder): builder.StartObject(2)
def CaptureResponseAddSamples(builder, samples): builder.PrependUOffsetTRelativeSlot(0, flatbuffers.number_types.UOffsetTFlags.py_type(samples), 0)
def CaptureResponseStartSamplesVector(builder, numElems): return builder.StartVector(4, numElems, 4)
def CaptureResponseAddSpectrum(builder, spectrum): builder.PrependUOffsetTRelativeSlot(1, flatbuffers.number_types.UOffsetTFlags.py_type(spectrum), 0)
def CaptureResponseStartSpectrumVector(builder, numElems): return builder.StartVector(8, numElems, 8)
def CaptureResponseEnd(builder): return builder.EndObject()
