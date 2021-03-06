export const SERVER = 'https://localhost:4000'
export function setFormState<T>(setState: (val: T) => void) {
    return function (e: any) {
        const value = e.currentTarget.value;
        setState(value);
    }
}
export function onTableRowClick<T>(val: T, setState: (setter: (prev: T | undefined) => T | undefined) => void) {
    setState(prev => {
        if (prev === val) {
            return undefined
        }
        return val
    })
}
export function chunks<T>(arr: T[], size = 1) {
    const res = [];
    for (let i = 0; i < arr.length / size; i++) {
        res[i] = arr.slice(i * size, Math.min(i * size + size, arr.length));
    }
    return res;
}